include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../alb"]
}

terraform {
  source = "../../../infrastructure-modules/cloudfront"
}


inputs = {
  alb_dns_name    = dependency.alb.outputs.alb_dns_name
  waf_web_acl_id  = "arn:aws:wafv2:us-east-1:864492617736:global/webacl/solitics-test/bfa066db-bdc7-4056-99ef-0c3f12262427"
  env             = "global"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "solitics-devops-terraform-state"
    key            = "global/cloudfront/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}
