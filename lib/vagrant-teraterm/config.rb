module VagrantTeraTerm
  class Config < Vagrant.plugin(2, :config)
    # Program file absolute path or command name if found in PATH.
    # If value is undefined, search
    #   ttermpro.exe
    #   C:\Program Files (x86)\teraterm\ttermpro.exe
    #   C:\Program Files\teraterm\ttermpro.exe
    #
    # @return [String]
    attr_accessor :exe_path

    # TERATERM.INI file absolute path or relative path.
    # Default is nil
    #
    # @return [String]
    attr_accessor :ini_path

    # Log file absolute path or relative path.
    # Default is nil
    #
    # @return [String]
    attr_accessor :log_path

    # Extra arguments.
    # Default is nil.
    #
    # @return [String]
    attr_accessor :extra_args

    def initialize
      @exe_path = UNSET_VALUE
      @ini_path = UNSET_VALUE
      @log_path = UNSET_VALUE
      @extra_args = UNSET_VALUE
    end

    def finalize!
      @exe_path = nil if @exe_path == UNSET_VALUE
      @ini_path = nil if @ini_path == UNSET_VALUE
      @log_path = nil if @log_path == UNSET_VALUE
      @extra_args = nil if @extra_args == UNSET_VALUE
    end
  end
end
