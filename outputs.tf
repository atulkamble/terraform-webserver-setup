output "instance_public_ip" {
  description = "Public IP of the deployed EC2 instance"
  value       = aws_instance.http_server.public_ip
}

output "instance_public_dns" {
  description = "Public DNS of the deployed EC2 instance"
  value       = aws_instance.http_server.public_dns
}
