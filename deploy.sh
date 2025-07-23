#!/bin/bash
chmod 400 aws/mywebserver.pem
terraform init
terraform apply -auto-approve
