git clone https://github.com/atulkamble/terraform-webserver-setup.git
cd terraform-webserver-setup

configure aws cli 

IAM - user - admingroup - policy - fulladminacess 

create acces key 

aws configure 

add access key, secrete acces key, us-east-1, json 

>> cli 

tree 

create key mywebserver.pem

update region code in main.tf 

crosscheck default vpc 

update vpc-id in main.tf 

update ami id from AWS EC2 Console 

update instance type 

update sg 

terraform init 
terraform plan
terraform apply 
terraform destroy


