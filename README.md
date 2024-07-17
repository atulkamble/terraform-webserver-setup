# terraform-webserver
Launch, Connnect and Install Webserver using Terraform

Tip: Your Terraform Configuration should be ready.

1. Launch EC2 instance
2. Connect via SSH
3. install terraform | terraform dependency - awscli - access key, secret access keys | aws configure 
4. install git
   ```
   sudo yum install git
   git --version
   git config --global user.name "username"
   git config --global user.email "email@gmail.com"
   ```
5. git clone
```
git clone https://github.com/atulkamble/terraform-webserver.git
cd terraform-webserver
```
OR

// Manual Creation of Project Files Creation from Powershell
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

5. sudo su
6. Create Keypair "mywebserver.pem" from AWS Account manually >> Save it to aws/aws_keys/mywebserver.pem project folder
   ```
   chmod 400 mywebserver.pem
   ```
8. update main.tf | Specify Region in Code | Update AWS Cloud Provider Setting | Configure ``` vpc-id, subnet-id (ap-south-1a or ap-south-1b), AMI-id ``` | Configure kepair name.
9. update variables.tf | update keypair name
10. Try following terraform commands
```
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
```
11. Copy public ip of instance and check in browser
```
terrfaform destroy
```
12. Upload your code to github repo 
```
#git push https://token@github.com/username/terraform-webserver.git
```
