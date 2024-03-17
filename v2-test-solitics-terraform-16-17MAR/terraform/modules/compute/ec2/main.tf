resource "aws_instance" "nginx" {
  ami                       = var.ami
  instance_type             = var.instance_type
  subnet_id                 = var.subnet_id
  key_name                  = var.key_name
  iam_instance_profile      = var.iam_instance_profile
  associate_public_ip_address = var.associate_public_ip_address

  user_data = <<-EOF
                #!/bin/bash
                if command -v yum &> /dev/null
                then
                  yum update -y
                  yum install -y nginx
                elif command -v apt-get &> /dev/null
                then
                  apt-get update -y
                  apt-get install -y nginx
                fi
                systemctl start nginx
                systemctl enable nginx
                echo "Hello to the Solitics Team" > /usr/share/nginx/html/index.html
                EOF

  tags = {
    Name        = "NginxInstance"
    Project     = "Solitics"
    Environment = "Production"
  }
}
