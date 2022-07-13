Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
    config.vm.network "private_network", ip: "192.168.56.4"
    config.vm.provision "shell", path: "install.sh"
end