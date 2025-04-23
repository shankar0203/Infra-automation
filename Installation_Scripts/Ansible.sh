# Install Ansible On Ubuntu

#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install prerequisites
sudo apt install -y software-properties-common

# Add Ansible PPA
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt install -y ansible

# Verify Ansible installation
ansible --version
