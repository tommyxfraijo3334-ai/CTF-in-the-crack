# Vagrantfile
Vagrant.configure("2") do |config|
  
  # 1. Define the VM
  # We'll use a standard Ubuntu 20.04 box
  config.vm.box = "ubuntu/focal64"

  # 2. Set up networking
  # This gives the VM a private IP that you can access from your host machine
  config.vm.network "private_network", ip: "192.168.33.10"

  # 3. Provisioning (This is the magic)
  # This tells Vagrant to run a shell script to set up the vulnerabilities
  # We will create "setup.sh" next.
  config.vm.provision "shell", path: "setup.sh"

end
