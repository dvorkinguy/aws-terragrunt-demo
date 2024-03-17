output "instance_id" {
  value = aws_instance.nginx.id
  description = "ID of the EC2 instance"
}

output "instance_public_ip" {
  value = aws_instance.nginx.public_ip
  description = "Public IP address of the EC2 instance"
}
