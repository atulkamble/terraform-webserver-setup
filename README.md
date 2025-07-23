# Terraform Web Server Setup (AWS EC2)

This project uses **Terraform** to provision an **Apache HTTP web server** on an **AWS EC2 instance** inside the default VPC. It also generates a secure SSH key pair, configures security groups, and automatically installs and starts Apache on the EC2 instance.

## 🛠 Features

- Deploys EC2 instance in AWS (Amazon Linux 2)
- Installs and starts Apache HTTPD server
- Generates and saves RSA private key securely
- Opens port **80 (HTTP)** and **22 (SSH)** via Security Group
- Automatically fetches the public IP of the instance
- Lightweight deployment using `t3.medium` instance
- Cross-platform `deploy.sh` automation script

## 📁 Project Structure

```bash
.
├── aws                     # Directory to store private key
├── deploy.sh               # Shell script to deploy infrastructure
├── instructions.md         # Step-by-step usage instructions
├── main.tf                 # Terraform config for AWS EC2 setup
├── outputs.tf              # Outputs the EC2 instance's public IP
├── README.md               # Project overview and usage
├── terraform.tfstate       # Terraform state file (auto-generated)
└── terraform.tfstate.backup
````

## 🚀 Quick Start

```bash
# 1. Clone this repo
git clone https://github.com/yourusername/terraform-webserver-setup.git
cd terraform-webserver-setup

# 2. Run the deployment script
chmod +x deploy.sh
./deploy.sh
```

## 🌍 Access Web Server

After deployment, the script will output and (on supported OS) open the web server in your default browser:

```
http://<Public-IP>
```

## 🔐 SSH Access

```bash
chmod 400 aws/mywebserver.pem
ssh -i aws/mywebserver.pem ec2-user@<Public-IP>
```

## 🧹 Destroy Infrastructure

To destroy the created infrastructure:

```bash
terraform destroy -auto-approve
```

## 📌 Requirements

* AWS CLI configured with access to create EC2 resources
* Terraform >= 1.5.0
* Bash shell (macOS/Linux)

# 📝 Instructions

```markdown
# Instructions: Deploy EC2 Web Server with Terraform

This guide walks you through deploying a basic Apache web server on AWS EC2 using Terraform.

---

## Prerequisites

- AWS account with EC2 access
- Terraform installed (`terraform -v`)
- AWS credentials configured via `aws configure` or environment variables

---

## Steps

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/terraform-webserver-setup.git
cd terraform-webserver-setup
````

---

### 2. Make Script Executable

```bash
chmod +x deploy.sh
```

---

### 3. Deploy Infrastructure

```bash
./deploy.sh
```

What this script does:

* Removes any existing key file (`aws/mywebserver.pem`)
* Initializes Terraform
* Applies the infrastructure
* Fetches the public IP
* Opens the web page in your browser

---

### 4. Access Web Server

Once deployed, visit:

```
http://<Public-IP>
```

You should see a message like:

```
Welcome to Webserver ip-172-31-xx-xx.ec2.internal
```

---

### 5. SSH into Instance (Optional)

```bash
chmod 400 aws/mywebserver.pem
ssh -i aws/mywebserver.pem ec2-user@<Public-IP>
```

---

### 6. Destroy Infrastructure (Optional)

```bash
terraform destroy -auto-approve
```

---

## Notes

* The RSA key pair is generated dynamically during deployment.
* The private key is saved to `aws/mywebserver.pem`
* Apache is installed and enabled on boot.
* The AMI used is Amazon Linux 2 (`ami-0cbbe2c6a1bb2ad63`) in `us-east-1`.

---

## Troubleshooting

* **Permission denied (publickey)**: Make sure `.pem` file has `chmod 400` and is the correct key.
* **Instance not accessible**: Ensure security group allows inbound SSH (22) and HTTP (80) traffic.
* **Key file not found**: Ensure `aws/` directory exists or re-run `deploy.sh`.

---

