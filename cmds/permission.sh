chmod 664 /etc/ansible/hosts
aws s3 cp s3://ml-test-env/Jenkins-key.pem /home/ubuntu
chmod 400 /home/ubuntu/Jenkins-key.pem