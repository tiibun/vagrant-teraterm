require('optparse')
require('pathname')

module VagrantTeraTerm
  class Command < Vagrant.plugin(2, :command)
    def self.synopsis
      "connects to machine via SSH using TeraTerm"
    end

    def execute
      opts = OptionParser.new do |opts|
        opts.banner = "Usage: vagrant teraterm [vm-name...]"

        opts.separator ""
      end

      argv = parse_options(opts)
      return -1 if !argv

      with_target_vms(argv, single_target: true) do |vm|
        @config = vm.config.teraterm

        ssh_info = vm.ssh_info
        @logger.debug("ssh_info is #{ssh_info}")
        # If ssh_info is nil, the machine is not ready for ssh.
        raise Vagrant::Errors::SSHNotReady if ssh_info.nil?

        exe_path = find_exe_path(@config.exe_path)
        return -1 if !exe_path

        commands = [
            "\"#{exe_path}\"",
            "#{ssh_info[:host]}",
            "#{ssh_info[:port]}",
            "/ssh",
            "/2",
            "/user=#{ssh_info[:username]}"
        ]


        if ssh_info.include?(:password)
          commands << "/passwd=#{ssh_info[:password]}"
          commands << "/auth=password"
        elsif ssh_info.include?(:private_key_path)
          Array(ssh_info[:private_key_path]).each do |p|
            commands << "/keyfile=#{File.expand_path(p)}"
          end
          commands << "/auth=publickey"
        end

        commands << "/ssh-A" if ssh_info[:forward_agent]
        commands << "/ssh-X" if ssh_info[:forward_x11]
        commands << "/f=#{absolute_winpath(@config.ini_path)}" if not @config.ini_path.nil?
        commands << "/L=#{absolute_winpath(@config.log_path)}" if not @config.log_path.nil?
        commands << @config.extra_args if not @config.extra_args.nil?

        @logger.debug(commands)
        do_process(commands)
      end
    end

    def find_exe_path(path)
      if not path.nil?
        return path if File.executable?(path)

        # search in PATH
        ENV['PATH'].split(File::PATH_SEPARATOR).each do |p|
          _p = Pathname(p) + path
          return _p.to_s if _p.executable?
        end
      else
        # search in PATH
        ENV['PATH'].split(File::PATH_SEPARATOR).each do |p|
          _p = Pathname(p) + 'ttermpro.exe'
          return _p.to_s if _p.executable?
        end

        # Program Files
        ['C:\Program Files (x86)\teraterm\ttermpro.exe',
         'C:\Program Files\teraterm\ttermpro.exe'].each do |p|
           return p if File.executable?(p)
        end
      end

      @env.ui.error("File is not found or executable. => #{path}")
      nil
    end

    def absolute_winpath(path)
      p = Pathname(path)
      return path.gsub(/\//, "\\") if p.absolute?
      return Pathname(@env.root_path).join(p).to_s.gsub(/\//, "\\")
    end

    def do_process(commands)
      pid = spawn(commands.join(" "))
      Process.detach(pid)
    end
  end
end
