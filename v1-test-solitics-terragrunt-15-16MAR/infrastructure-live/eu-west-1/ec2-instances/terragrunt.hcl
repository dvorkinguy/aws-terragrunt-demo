include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../vpc"]  # Ensures VPC is ready before deploying instances
}


terraform {
  source = "../../../infrastructure-modules/ec2"
}




inputs = {
  instance_count  = 2
  instance_type   = "t3.micro"
  ami_id          = "ami-0c1c30571d2dae5c9"  # Ensure this is valid in eu-west-1
  subnet_id       = dependency.vpc.outputs.public_subnet_ids[0]
  key_name        = "your-key-pair-name"
  private_key_path = "/path/to/your/private/key"
  user_data       = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install nginx -y
    echo 'Warm greetings to the Solitics team!' | sudo tee /var/www/html/index.nginx-debian.html
    sudo systemctl start nginx
    sudo systemctl enable nginx
EOF
  security_group_id = "sg-08c87e5fe28300427"  # Replace with your security group ID
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "solitics-devops-terraform-state"
    key            = "eu-west-1/ec2-instances/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}
