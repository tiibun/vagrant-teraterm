# Vagrant TeraTerm Plugin

This is a Vagrant plugin that enables to ssh into vm with TeraTerm.

## Installation

```
vagrant plugin install vagrant-teraterm
```

## Usage

```
vagrant teraterm
```

## Configuration

```ruby
Vagrant.configure(2) do |config|
  # ...
  config.teraterm.exe_path = 'C:\Program Files (x86)\teraterm\ttermpro.exe'
  config.teraterm.ini_path = "teraterm.ini"
  config.teraterm.log_path = "teraterm.log"
  config.teraterm.extra_args = "/ssh-v"
  # ...
end
```

* ```exe_path``` A ttermpro.exe file path. We will find real path
  * If set and executable, use it.
  * If set and not executable, search in PATH.
  * If not set, search "ttermpro.exe" in PATH.
  * If not found in PATH, use 'C:\Program Files (x86)\teraterm\ttermpro.exe'
 or 'C:\Program Files\teraterm\ttermpro.exe'
* ```ini_path``` TERATERM.INI file absolute path or relative path from current dir.
* ```log_path``` Log file absolute path or relative path from current dir.
* ```extra_args``` Extra arguments.




## Contributing

1. Fork it ( https://github.com/tiibun/vagrant-term/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Thanks

Vagrant ( https://github.com/https://github.com/mitchellh/vagrant )
vagrant-multi-putty ( https://github.com/nickryand/vagrant-multi-putty )
