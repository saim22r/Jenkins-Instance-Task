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