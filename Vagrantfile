Vagrant.configure("2") do |config|

  # This is the correct line:
  config.vm.box = "ubuntu/focal64"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provision "shell", path: "setup.sh"

end
