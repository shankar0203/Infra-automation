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
