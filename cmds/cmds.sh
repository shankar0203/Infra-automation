pwd
cd Terraform_Scripts

# Terraform cmds
terraform init
# terraform destroy -auto-approve
# terraform plan -var-file="terraform.tfvars"
# terraform apply -auto-approve -var-file="terraform.tfvars"

# Get the public IP from Terraform output
PUBLIC_IP=$(terraform output -raw ec2_public_ip)
echo "$PUBLIC_IP" > /tmp/ec2_instance_ip.txt
echo "Public IP of created EC2: $PUBLIC_IP"

# Ansible inventory update
HOST_FILE="/etc/ansible/hosts"
GROUP_NAME="webservers"
ANSIBLE_USER="ubuntu"
KEY_PATH="/home/ubuntu/Jenkins-key.pem"
HOST_ENTRY="$PUBLIC_IP ansible_user=$ANSIBLE_USER ansible_ssh_private_key_file=$KEY_PATH"

# Backup before edit
cp $HOST_FILE ${HOST_FILE}.bak

# Check if group exists, if not, add it
if ! grep -q "^\[$GROUP_NAME\]" "$HOST_FILE"; then
  echo -e "\n[$GROUP_NAME]" >> "$HOST_FILE"
fi

# Add full host entry under the group if not already present
if ! awk "/^\[$GROUP_NAME\]/ {found=1} /^\[/ {found=0} found && /$PUBLIC_IP/ {exit 1} END {if (found) exit 0; else exit 1}" "$HOST_FILE"; then
  sed -i "/^\[$GROUP_NAME\]/a $HOST_ENTRY" "$HOST_FILE"
  echo "✅ Host entry added: $HOST_ENTRY"
else
  echo "ℹ️ Host entry for $PUBLIC_IP already exists under group [$GROUP_NAME]"
fi
