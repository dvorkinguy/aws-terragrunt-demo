variable "ami" {
  description = "The AMI to use for the instance."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start."
  type        = string
}

variable "subnet_id" {
  description = "The VPC subnet ID to launch in."
  type        = string
}

variable "key_name" {
  description = "The key name of the Key Pair to use for the instance. Leave as null if not using SSH."
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the resource"
  type        = list(string)
  default     = []
}

variable "iam_instance_profile" {
  description = "The IAM instance profile ARN to associate with the EC2 instance."
  type        = string
  default     = ""
}

variable "user_data" {
  description = "The user data to provide when launching the instance."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address with the instance. Set to false if using a NAT Gateway."
  type        = bool
  default     = true
}
