chmod 664 /etc/ansible/hosts
aws s3 cp s3://ml-test-env/Jenkins-key.pem /home/ubuntu
chmod 400 /home/ubuntu/Jenkins-key.pem


ansible-playbook -i inventory.ini --private-key ec2_keypair.pem install_httpd.yml -u ec2-user


pwd
cd Terraform_Scripts

# Terraform cmds
terraform init
terraform destroy -auto-approve
terraform plan -var-file="terraform.tfvars"
terraform apply -auto-approve -var-file="terraform.tfvars"

# Get the public IP from Terraform output
PUBLIC_IP=$(terraform output -raw ec2_public_ip)
echo "$PUBLIC_IP" > /tmp/ec2_instance_ip.ini
echo "Public IP of created EC2: $PUBLIC_IP"


cd ..
cd Ansible_Scripts
ls
ansible $PUBLIC_IP -m ping
ansible-playbook -i $PUBLIC_IP --private-key=private-key=/path/to/Jenkins-key.pem playbook.yml -u ec2-user
# ansible-playbook -i inventory.ini -u ec2-user --private-key=/path/to/Jenkins-key.pem playbook.yml




Update code
-----------

pwd
cd Terraform_Scripts

# Terraform cmds
terraform init
terraform destroy -auto-approve
terraform plan -var-file="terraform.tfvars"
terraform apply -auto-approve -var-file="terraform.tfvars"

# Get the public IP from Terraform output
PUBLIC_IP=$(terraform output -raw ec2_public_ip)
echo "$PUBLIC_IP" > /tmp/ec2_instance_ip.ini
echo "Public IP of created EC2: $PUBLIC_IP"



echo "[webservers]" > /etc/ansible/inventory.ini
echo "$PUBLIC_IP ansible_ssh_user=ec2-user ansible_ssh_private_key_file=/home/ubuntu/Jenkins-key.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'" >> /etc/ansible/inventory.ini
cd ..
cd Ansible_Scripts
# Run the playbook with the generated inventory file
ansible-playbook -i /etc/ansible/inventory.ini /var/lib/jenkins/workspace/Test/Ansible_Scripts/playbook.yml



lastest code
------------

pwd
cd Terraform_Scripts

# Terraform cmds
terraform init
# terraform destroy -auto-approve
terraform plan -var-file="terraform.tfvars"
terraform apply -auto-approve -var-file="terraform.tfvars"

# Get the public IP from Terraform output
PUBLIC_IP=$(terraform output -raw ec2_public_ip)
echo "$PUBLIC_IP" > /tmp/ec2_instance_ip.ini
echo "Public IP of created EC2: $PUBLIC_IP"

echo "[webservers]" > /etc/ansible/hosts
echo "$PUBLIC_IP ansible_ssh_user=ec2-user ansible_ssh_private_key_file=/var/lib/jenkins/Jenkins-key.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'" >> /etc/ansible/hosts
cd ..
cd Ansible_Scripts
# Run the playbook with the generated inventory file
ansible all -m ping
ansible-playbook -i /etc/ansible/inventory.ini /var/lib/jenkins/workspace/Test/Ansible_Scripts/playbook.yml


