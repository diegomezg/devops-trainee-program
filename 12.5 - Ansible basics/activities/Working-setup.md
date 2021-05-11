# What is Vagrant

Vagrant is a nice and powerful tool to test environments using your favorite hypervisor. (VirtualBox, VMWare, Docker, etc).

# Download Vagrant

Vagrant can be installed in two ways, if you're on a mac then something like this should do the trick:

```sh
brew tap hashicorp/tap
brew install hashicorp/tap/vagrant
```

Alternatively, if you're using Linux, then download the following binary and put it under **/usr/bin/vagrant** or just follow the instructions below:

```sh
## RedHat derivated (CentOS - Redhat)
cd /tmp && curl -O https://releases.hashicorp.com/vagrant/2.2.16/vagrant_2.2.16_x86_64.rpm
rpm -ivh /tmp/vagrant_2.2.16_x86_64.rpm

## Debian derivated (Ubuntu - Debian)
cd /tmp && curl -O https://releases.hashicorp.com/vagrant/2.2.16/vagrant_2.2.16_x86_64.deb
dpkg -i /tmp/vagrant_2.2.16_x86_64.deb
```

# Preparing our setup

Ansible is nice. For this course, let's create our own lab using only a few commads.

 - Install the VirtualBox plugin to share
```sh
vagrant plugin install vagrant-vbguest 
```

 - Copy the following code and paste in a new file called **Vagrantfile** (If you want to feel the power, use VIM)
```sh
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.synced_folder '.', '/vagrant', disabled: false
  config.vm.provider :virtualbox do |v|
    v.memory       = 512
    v.cpus         = 1
    v.linked_clone = true
  end 

  config.vm.define "ansible-1" do |ansible1|
    ansible1.vm.box = "centos/7"
    ansible1.vm.hostname = "ansible01-centos7.dou.com"
    ansible1.vm.network :private_network, ip: "192.168.33.2"
    ansible1.vm.provision :shell, :inline => "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo systemctl restart sshd; sudo yum -y install epel-release libselinux-python && sudo yum clean all && sudo yum makecache && sudo yum -y install htop;", run: "always" 
  end 

  config.vm.define "ansible-2" do |ansible2|
    ansible2.vm.box = "ubuntu/trusty64"
    ansible2.vm.hostname = "ansible02-ubuntu.dou.com"
    ansible2.vm.network :private_network, ip: "192.168.33.3"
    ansible2.vm.provision :shell, :inline => "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo service ssh restart; sudo apt-get update -yqq && apt-get install -y python-selinux;", run: "always" 
  end 
end
```

 - Run your environment with:
```sh
vagrant up
```
This run will take some time to complete; Vagrant will download the base images and build a new kernel with your custom plugins. Be patient.

Once that everything is in place, lets check the status:
```sh
miguel@Miguels-MacBook-Pro /tmp % vagrant status       
Current machine states:

ansible-1                 running (virtualbox)
ansible-2                 running (virtualbox)
```

What the hell happened? Well, vagrant took care of everything, network, packages, everything. Your IP's are the following, respectively:

 - ansible-1 (running centOS 7): 192.169.33.2
 - ansible-2 (running ubuntu): 192.168.33.3

Nice, eh? Try ping in those ip's:
```sh
miguel@Miguels-MacBook-Pro /tmp % for i in {2,3}; do ping -c4 192.168.33.$i; done
PING 192.168.33.2 (192.168.33.2): 56 data bytes
64 bytes from 192.168.33.2: icmp_seq=0 ttl=64 time=0.567 ms
64 bytes from 192.168.33.2: icmp_seq=1 ttl=64 time=0.543 ms
64 bytes from 192.168.33.2: icmp_seq=2 ttl=64 time=0.797 ms
64 bytes from 192.168.33.2: icmp_seq=3 ttl=64 time=0.430 ms

--- 192.168.33.2 ping statistics ---
4 packets transmitted, 4 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 0.430/0.584/0.797/0.133 ms
PING 192.168.33.3 (192.168.33.3): 56 data bytes
64 bytes from 192.168.33.3: icmp_seq=0 ttl=64 time=0.400 ms
64 bytes from 192.168.33.3: icmp_seq=1 ttl=64 time=0.607 ms
64 bytes from 192.168.33.3: icmp_seq=2 ttl=64 time=0.764 ms
64 bytes from 192.168.33.3: icmp_seq=3 ttl=64 time=0.463 ms

--- 192.168.33.3 ping statistics ---
4 packets transmitted, 4 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 0.400/0.558/0.764/0.140 ms
```

If you finished your tasks, delete everything with:
```sh
vagrant destroy -f
```

