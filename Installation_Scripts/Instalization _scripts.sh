cd Infra-automation
chmod 777 Install_AWS_CLI.sh Install_Ansible.sh Install_Jenkins.sh Install_Terraform.sh startup_script.sh
./Install_AWS_CLI.sh
./Install_Ansible.sh
./Install_Terraform.sh
./Install_Jenkins.sh
chmod 777 /etc/ansible
chmod 777 /etc/ansible/hosts
touch hosts.bak
chmod 400 /etc/ansible/hosts.bak
aws s3 cp s3://ml-test-env/Jenkins-key.pem /home/ubuntu
chmod 400 /home/ubuntu/Jenkins-key.pem
sudo cp /home/ubuntu/Jenkins-key.pem /var/lib/jenkins/
sudo chown jenkins:jenkins /var/lib/jenkins/Jenkins-key.pem
sudo chmod 400 /var/lib/jenkins/Jenkins-key.pem
sudo chown jenkins:jenkins /var/lib/jenkins/Jenkins-key.pem
sudo chmod 400 /var/lib/jenkins/Jenkins-key.pem
