````markdown
# 🛠️ Instructions: Launch a Web Server using Terraform on AWS

This guide walks you through setting up a fully automated Apache webserver on an EC2 instance using Terraform and AWS CLI.

---

## ✅ Step-by-Step Instructions

### 1️⃣ Clone the Terraform Project

```bash
git clone https://github.com/atulkamble/terraform-webserver-setup.git
cd terraform-webserver-setup
````

---

### 2️⃣ Configure AWS CLI

Create an IAM user with the following:

* **Group:** `admin-group`
* **Policy:** `AdministratorAccess`
* **Access type:** Programmatic access

Then configure AWS CLI:

```bash
aws configure
```

Enter:

* AWS Access Key ID
* AWS Secret Access Key
* Default region: `us-east-1`
* Output format: `json`

---

### 3️⃣ Project Directory Structure

Check the directory tree:

```bash
tree
```

Expected structure:

```bash
terraform-webserver-setup/
├── aws/
│   └── mywebserver.pem   # Your private key
├── main.tf
├── variables.tf
├── README.md
├── instructions.md
└── .gitignore
```

---

### 4️⃣ Create Key Pair

From the AWS EC2 Console:

* Go to **Key Pairs**
* Create a key named `mywebserver`
* Download the `.pem` file
* Move it to `aws/mywebserver.pem`

Secure the key:

```bash
chmod 400 aws/mywebserver.pem
```

---

### 5️⃣ Update Terraform Configuration

> Note: This is **mostly automated** now, but cross-check as needed.

#### 🔁 Verify the Following in `main.tf`:

* **Region:** Ensure it's set to `us-east-1` or your desired region.
* **AMI ID:** Use a valid Amazon Linux 2 AMI from EC2 console (e.g. `ami-0cbbe2c6a1bb2ad63`).
* **Instance Type:** Recommended: `t3.medium` or `t2.micro` (if free tier).
* **VPC/Subnet:** Now fetched dynamically via `data` block.
* **Security Group:** Automatically created with HTTP (80) and SSH (22) open.

---

### 6️⃣ Deploy Infrastructure with Terraform

```bash
terraform init         # Initialize project
terraform plan         # Review execution plan
terraform apply        # Apply and deploy
```

This will:

* Create security group
* Launch EC2 instance
* Auto-install Apache via `user_data`
* Output the public IP of the instance

---

### 7️⃣ Access the Web Server

Open your browser and visit:

```
http://<public-ip>
```

Expected Output:

```
Welcome to Webserver <hostname>
```

---

### 8️⃣ Tear Down Infrastructure

To delete all AWS resources created:

```bash
terraform destroy -auto-approve
```

---

## 🔒 Notes & Best Practices

* Never commit `.pem` files or `.tfstate` to Git.
* Make sure `.gitignore` includes:

  ```bash
  *.pem
  *.tfstate*
  .terraform/
  ```
* You can automate deployment via a `deploy.sh` script.

---

✅ You’ve successfully launched and configured a webserver using Terraform in an automated and secure way.

📬 Need CI/CD or GitHub Actions setup next? Let me know!

```

---

