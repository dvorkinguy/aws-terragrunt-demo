terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "path/to/your/state/file"
    region = "us-east-1"
  }
}
