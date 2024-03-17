resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  user_data     = var.user_data
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "WebServer-${count.index}"
  }

  provisioner "remote-exec" {
    inline = [
      "until curl -sf http://localhost; do echo 'Waiting for Nginx to respond...'; sleep 5; done",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}

output "instance_ids" {
  value = tolist(aws_instance.web.*.id)
}

output "instance_public_ips" {
  value = tolist(aws_instance.web.*.public_ip)
}

# Adjust the variables.tf accordingly, especially adding:
variable "security_group_id" {
  description = "Security group ID to associate with the EC2 instances."
  type        = string
}
