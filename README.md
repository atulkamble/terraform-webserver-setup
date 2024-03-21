# terraform-webserver
Launch, Connnect and Install Webserver using Terraform
```
git clone https://github.com/atulkamble/terraform-webserver.git
cd terraform-webserver
```

Tip: Your Terraform Configuration should be ready.

1) Naviagte to EC2 
2) Create keypair | Copy keypair to aws/aws_keys.keypair.pem
3) create main.tf
4) Configure vpc-id, subnet-id, AMI-id
5) Configure kepair name.
6) variables.tf | update keypair name
7) 
```
terraform init
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
#git push https://token@github.com/userbname/terraform-webserver.git
```
