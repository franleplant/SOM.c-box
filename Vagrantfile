VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provision "shell", path: "install.sh"

  config.vm.synced_folder "shared", "/home/vagrant/shared"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"


  config.vm.provider :virtualbox do |vb|
    # Turn this into true when you want GUI
    vb.gui = false
  
    vb.memory = 1024
    vb.cpus = 2
  end

end
