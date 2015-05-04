require "vagrant"

module VagrantTeraTerm
  class Plugin < Vagrant.plugin("2")
    name "TeraTerm Plugin"
    description <<-DESC
    This plugin enables to ssh into vm with TeraTerm.
    DESC

    command "teraterm" do
      require_relative "command"
      Command
    end

    config "teraterm" do
      require_relative "config"
      Config
    end
  end
end
