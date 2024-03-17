include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../infrastructure-modules/transit-gateway"
}


dependencies {
  paths = [
    "../eu-west-1/vpc",
    "../eu-west-2/dev/vpc",
    "../eu-west-2/staging/vpc",
  ]
}

inputs = {
  // Assuming your VPC module outputs include VPC IDs and subnet IDs.
  // Adjust these to point to the correct dependency outputs or hardcoded values as needed.
  vpc_attachment_ids = [
    dependency.eu-west-1-vpc.outputs.vpc_id,
    dependency.eu-west-2-dev-vpc.outputs.vpc_id,
    dependency.eu-west-2-staging-vpc.outputs.vpc_id,
  ]

  subnet_ids = [
    dependency.eu-west-1-vpc.outputs.private_subnet_ids,
    dependency.eu-west-2-dev-vpc.outputs.private_subnet_ids,
    dependency.eu-west-2-staging-vpc.outputs.private_subnet_ids,
  ]
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "solitics-devops-terraform-state"
    key            = "transit-gateway/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}
