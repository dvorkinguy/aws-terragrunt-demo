include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../eu-west-2/dev/vpc"
}

terraform {
  source = "../../../infrastructure-modules/alb"
}


inputs = {
  vpc_id           = dependency.vpc.outputs.vpc_id
  subnet_ids       = dependency.vpc.outputs.public_subnet_ids
  alb_name         = "global-alb"
  security_groups  = [dependency.vpc.outputs.alb_security_group_id]
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "solitics-devops-terraform-state"
    key            = "global/alb/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}
