output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web.id
}

output "private_ip" {
  description = "Private IP address of EC2 instance"
  value       = aws_instance.web.private_ip
}

output "public_ip" {
  description = "Public IP address of EC2 instance"
  value       = aws_instance.web.public_ip
}

output "ami_id" {
  description = "AMI ID used for the instance"
  value       = aws_instance.web.ami
}