#!/bin/bash
echo "⚙️  Starting Terraform Webserver Deployment..."

# Clean up old key if exists
if [ -f aws/mywebserver.pem ]; then
  echo "🔁 Removing old key..."
  rm -f aws/mywebserver.pem
fi

mkdir -p aws
chmod 700 aws

terraform init
terraform apply -auto-approve

echo "✅ Deployment completed."
echo "🔐 Your private key is saved at aws/mywebserver.pem"

