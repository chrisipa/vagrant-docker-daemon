# specify os constants
module OS
  def OS.windows?
      (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
      (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.unix?
      !OS.windows?
  end

  def OS.linux?
      OS.unix? and not OS.mac?
  end
end

# create virtual machine
Vagrant.configure("2") do |config|

  # set virtual machine image
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # set provider
  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.name = "Docker Daemon"
    v.memory = 1024
    v.cpus = 1
  end  

  # set hostname
  config.vm.hostname = "docker"

  # use nat networking
  config.vm.network "private_network", type: "dhcp"

  # execute shell scripts in vm
  config.vm.provision "shell", path: "bootstrap/inputrc.sh", privileged: true
  config.vm.provision "shell", path: "bootstrap/bashrc.sh", privileged: false
  config.vm.provision "shell", path: "bootstrap/docker.sh", privileged: false
  config.vm.provision "shell", path: "bootstrap/daemon.sh", privileged: true, env: {"HOST_IS_WINDOWS" => OS.windows?}

end