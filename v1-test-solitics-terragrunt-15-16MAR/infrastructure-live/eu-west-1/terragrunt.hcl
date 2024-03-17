# infrastructure-live/eu-west-1/terragrunt.hcl

remote_state {
  backend = "s3"
  config = {
    bucket         = "solitics-devops-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-2"  # Ensure this matches your S3 bucket's region
    encrypt        = true
    dynamodb_table = "terraform-lock-table"  # Ensure this DynamoDB table exists
  }
}


