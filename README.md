# Project: Automated Deployment of HTTPD Server using Ansible, Terraform, and Jenkins on AWS

## 📋 Project Summary
This project automates the provisioning of an EC2 instance using **Terraform** and configures it as an **HTTPD web server** using **Ansible**.  
The entire process is orchestrated through a **Jenkins** pipeline and deployed fully on **AWS Cloud**.

---

## 🚀 Setup Instructions

Follow these steps to set up and run the project:

### 1. Launch an Ubuntu EC2 Instance
- Create a new **Ubuntu** EC2 instance from the AWS Console.
- It is recommended to use a t2.micro or t2.medium instance type for testing.

---

### 2. Clone the GitHub Repository
SSH into your EC2 machine and clone the GitHub repository:

```bash
git clone https://github.com/shankar0203/Infra-automation.git
```

---

### 3. Navigate to the Installation Scripts Folder
Move into the `Installation_Scripts` directory:

```bash
cd Infra-automation/Installation_Scripts
```

---

### 4. Set Permissions for the Installation Script
Make the installation script executable:

```bash
chmod +x Installation_Scripts.sh
```

---

### 5. Run the Installation Script
Execute the script to install all required packages and applications:

```bash
./Installation_Scripts.sh
```

> This script will install Terraform, Ansible, Jenkins, and other necessary tools.

---

### 6. Add IAM Role to the EC2 Machine
- Attach an **IAM role** with **AdminAccess** (for lab/testing purposes only).
- **Note:** It is **NOT recommended** to use Admin roles in production environments.

---

### 7. Open Port 8080 for Jenkins
Update your EC2 **Security Group** to allow inbound traffic on **port 8080**.

---

### 8. Access Jenkins
Once Jenkins is installed:
- Open your browser.
- Visit:  
  ```
  http://<EC2-Public-IP>:8080
  ```
- Unlock Jenkins using the initial password:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

### 9. Create a Freestyle Jenkins Project
- Create a new **Freestyle Project** inside Jenkins.
- In the **Build** section, add the following command from your repository:

```bash
# Navigate to the directory where cmds.sh exists
copy the cmds from Infra-automation/Infra-automation/cmds

# paste the script/Cmds
Paste the copied cmds to post build option as shell cmds

---

### 10. Build the Jenkins Job
- Click **Build Now** to start the job.

---

### 11. Outcome of the Build
- A new EC2 instance will be provisioned automatically using **Terraform**.
- The **HTTPD server** will be installed and configured on the new machine using **Ansible Playbooks**.

---

### 12. Verify the Setup
- After a successful build, note the **Public IP** of the newly created EC2 instance.
- Open a browser and visit:

```
http://<New-EC2-Public-IP>
```

- You should see the **HTTPD server default page**.

---

## ⚠️ Important Notes
- This setup is for **testing and learning purposes**.
- Always follow best practices for IAM roles and security in production environments.
- Clean up unused EC2 instances and resources to avoid unnecessary AWS billing.

---

# ✅ Final Deliverables
- Jenkins installed and configured.
- EC2 instance launched using Terraform.
- HTTPD server deployed using Ansible.
- Fully automated deployment via Jenkins pipeline.

---

# 📢 Credits
This project is part of a learning exercise on DevOps automation using AWS, Terraform, Ansible, and Jenkins.

### GitHub Repository:
[https://github.com/shankar0203/Infra-automation.git](https://github.com/shankar0203/Infra-automation.git)

