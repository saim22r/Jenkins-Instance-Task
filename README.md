# Running Jenkins Locally
## Prerequisites 
- Vagrant and Virtual box installed
- Appropriate text editor installed to run the vagrantfile. Sublime used in this case.

## Vagrantfile set-up
- The following will set-up the VM
- `hashicorp/bionic64` will specify the box
- The IP will allow us to access jenkins
```
Vagrant.configure("2") do |config|
    
    config.vm.box = "hashicorp/bionic64"
    config.vm.network "private_network", ip: "192.168.10.100" # Use port 8080
    config.vm.provision "shell", path: "provision.sh"
end
```

## Provision file set-up
- The following code will update packages, install the latest version of java and jenkins
- `vagrant up` in the correct directory
- Let the files install for 5-10 minutes
- `vagrant ssh` into the VM and navigate to the IP in your browser
```
#!/bin/bash
sudo apt-get update -y # Update package list
sudo apt-get upgrade -y # Find new versions of the packages

# Install the latest version of java
sudo apt install openjdk-11-jdk -y 
java -version

# Install jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install jenkins -y
```