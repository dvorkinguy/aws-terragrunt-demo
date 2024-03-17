include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../infrastructure-modules/vpc"
}

inputs = {
  env = "eu-west-1"
  vpc_cidr_block = "10.0.0.0/16"
  azs = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_tags = { "Environment" = "Private", "Tier" = "Backend" }
  public_subnet_tags  = { "Environment" = "Public", "Tier" = "Frontend" }
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "solitics-devops-terraform-state"
    key            = "eu-west-1/vpc/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

