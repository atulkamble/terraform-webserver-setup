# 🚀 Launch and Configure Webserver Automatically using Terraform on AWS

This project uses **Terraform** to provision an **EC2-based Apache webserver** on **AWS**, fully automated using `user_data`. It dynamically fetches default VPC and subnet, provisions a security group, launches the EC2 instance, and bootstraps the webserver automatically — no SSH required.

---

## ✅ Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) configured with `aws configure`
- Git installed (`git --version`)
- A valid AWS Key Pair named `mywebserver` downloaded locally

---

## 📁 Project Structure

```bash
terraform-webserver-setup/
├── aws/
│   └── mywebserver.pem         # Your private key (DO NOT COMMIT TO GIT)
├── main.tf                     # Main Terraform configuration
├── variables.tf                # Terraform variables
├── instructions.md             # Manual instructions or notes
├── README.md                   # This file
└── .gitignore                  # Ignores sensitive and temp files
````

---

## 🚀 Steps to Deploy

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/atulkamble/terraform-webserver-setup.git
cd terraform-webserver-setup
```

### 2️⃣ Add Your Key Pair

Download your AWS key pair (e.g. `mywebserver.pem`) from the AWS Console, and place it into:

```bash
aws/mywebserver.pem
chmod 400 aws/mywebserver.pem
```

### 3️⃣ Review the Terraform Files

* `main.tf` uses:

  * Dynamic VPC & Subnet fetching
  * EC2 provisioning with `user_data` for Apache install
  * No SSH required
* `variables.tf` points to your private key location (used only for provisioning if needed)

### 4️⃣ Initialize and Apply Terraform

```bash
terraform init
terraform validate
terraform fmt
terraform apply -auto-approve
```

Terraform will:

* Create a security group with HTTP + SSH open
* Launch a t3.medium EC2 instance using the provided AMI
* Automatically install and start Apache via `user_data`
* Print public IP once done

---

## 🌐 Access the Webserver

Once `terraform apply` completes, access the Apache server in your browser using:

```
http://<public-ip>
```

You should see:

```
Welcome to Webserver <hostname>
```

---

## 🧹 Cleanup Resources

To destroy all created infrastructure:

```bash
terraform destroy -auto-approve
```

---

## 💻 Optional: Deploy via Script

Use the provided helper script to automate:

```bash
chmod +x deploy.sh
./deploy.sh
```

Add this file (`deploy.sh`):

```bash
#!/bin/bash
chmod 400 aws/mywebserver.pem
terraform init
terraform apply -auto-approve
```

---

## 🚫 Important: Git Ignore

Ensure `.pem` files and Terraform state files are not committed. Add a `.gitignore` file:

```gitignore
*.pem
*.tfstate*
.terraform/
```

---

## ✅ Final Notes

* This setup avoids SSH provisioning for faster, fully-automated deployments.
* Ideal for demos, learning, or base automation pipelines.
* Customize tags, AMI, and `user_data` to match your use case.

---

📬 **Need CI/CD or GitHub Actions Integration?**
Ask for a ready-made `.github/workflows/terraform.yml` file for full GitHub automation!

```

---

