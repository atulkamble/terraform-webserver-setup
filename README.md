# terraform-webserver
1. Launch EC2 instance
2. Connect via SSH
3. Create Keypair "mywebserver.pem" >> Save it to aws/aws_keys/mywebserver.pem
4. terraform dependency - awscli - access key, secret access keys | aws configure
5. install git
   ```
   sudo yum install git
   git --version
   git config --global user.name "username"
   git config --global user.email "email@gmail.com"
   ```
6. update keypair
7. git clone
8. sudo su
9. update main.tf | vpc-id, subnet-id (ap-south-1a or ap-south-1b)
10. terraform commands
    ```
    terraform init, plan, apply, destroy
    ```
 
Launch, Connnect and Install Webserver using Terraform
```
git clone https://github.com/atulkamble/terraform-webserver.git
cd terraform-webserver
```

Tip: Your Terraform Configuration should be ready.

// Project Files Creation from Powershell
```
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

1) Naviagte to EC2 
2) Create keypair | Copy keypair to aws/aws_keys/mywebserver.pem
3) ```
   chmod 400 mywebserver.pem
   ```
4) create main.tf
5) Specify Region in Code
6) Update AWS Cloud Provider Setting
7) Configure vpc-id, subnet-id, AMI-id
8) Configure kepair name.
9) variables.tf | update keypair name
10) 
```
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
```
8) Copy public ip of instance and check in browser
9) 
```
terrfaform destroy
```
10) Upload your code to github repo 
```
#git push https://token@github.com/username/terraform-webserver.git
```
