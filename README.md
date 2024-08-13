# Launch and Configure Webserver using Terraform

This project provides a detailed guide for launching, connecting to, and configuring a webserver on AWS using Terraform. The steps include configuring Terraform, managing AWS resources, and ensuring a successful deployment.

## Prerequisites

- Ensure Terraform is installed and configured.
- Ensure AWS CLI is installed and configured with your access and secret keys using `aws configure`.
- Ensure Git is installed.

## Steps

### 1. Launch EC2 Instance

Begin by launching an EC2 instance through the AWS Management Console or using a predefined Terraform configuration.

### 2. Connect to EC2 Instance

Connect to your EC2 instance via SSH using the appropriate key pair.

### 3. Install Terraform and Dependencies

If Terraform is not already installed, follow the instructions to install it. Also, ensure that AWS CLI is set up and configured:
```bash
# Install Terraform
# Ensure AWS CLI is configured
aws configure
```

### 4. Install Git

Install Git on your instance:
```bash
sudo yum install git -y
git --version
git config --global user.name "username"
git config --global user.email "email@gmail.com"
```

### 5. Clone the Repository

Clone the repository containing the Terraform configurations:
```bash
git clone https://github.com/atulkamble/terraform-webserver-setup
cd terraform-webserver-setup
```

Alternatively, create the project files manually using PowerShell:
```powershell
mkdir terraformproject
cd .\terraformproject\
New-Item main.tf
New-Item variables.tf
code .
mkdir aws
cd aws
mkdir aws_keys
cd .\aws_keys\
```

### 6. Create Key Pair

Create an AWS key pair named `mywebserver.pem` through the AWS Management Console. Save the key pair to the `aws/aws_keys/` directory:
```bash
chmod 400 aws/aws_keys/mywebserver.pem
```

### 7. Update Terraform Configuration

Update `main.tf` with the following:
- Specify the AWS region.
- Configure AWS provider settings.
- Set the VPC ID, subnet ID, and AMI ID.
- Configure the key pair name.

Update `variables.tf` to include the key pair name.

### 8. Initialize and Apply Terraform Configuration

Run the following Terraform commands to initialize, validate, format, plan, and apply the configuration:
```bash
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
```

### 9. Verify Deployment

Once Terraform has successfully applied the configuration, retrieve the public IP address of the instance and verify the webserver by accessing it via a browser.

### 10. Clean Up

If you need to destroy the resources created by Terraform:
```bash
terraform destroy
```

### 11. Commit and Push Code

Commit your changes and push them to the GitHub repository:
```bash
git add .
git commit -m "Initial commit"
git push origin main
```
For private repositories, use your GitHub token:
```bash
git push https://token@github.com/username/terraform-webserver.git
```

By following these steps, you will successfully deploy and manage a webserver on AWS using Terraform.

