cd Infra-automation
chmod 777 Install_AWS_CLI.sh Install_Ansible.sh Install_Jenkins.sh Install_Terraform.sh startup_script.sh
./Install_AWS_CLI.sh
./Install_Ansible.sh
./Install_Terraform.sh
./Install_Jenkins.sh
chmod 664 /etc/ansible/hosts
chmod 400 /home/ubuntu/Jenkins-key.pem


