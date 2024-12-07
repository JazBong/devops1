# Front load the includes
include_vagrantfile = File.expand_path("../include/_Vagrantfile", __FILE__)
load include_vagrantfile if File.exist?(include_vagrantfile)

Vagrant.configure("2") do |config|
  config.vm.base_mac = "025A42466BB2"
  config.vm.box = "ubuntu/jammy64"

  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "6144" 
    vb.cpus = 4
    vb.customize [ "modifyvm", :id, "--uart1", "0x3F8", "4" ]
    vb.customize [ "modifyvm", :id, "--uartmode1", "file", File::NULL ]
  end
end
