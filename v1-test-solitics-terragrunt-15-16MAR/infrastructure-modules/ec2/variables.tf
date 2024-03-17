variable "instance_count" {
  description = "The number of instances to launch."
  type        = number
}

variable "ami_id" {
  description = "The AMI ID for the instances."
  type        = string
}

variable "instance_type" {
  description = "The instance type."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the instances in."
  type        = string
}

variable "user_data" {
  description = "User data to initialize the instances."
  type        = string
}

variable "key_name" {
  description = "The key pair name."
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file for SSH."
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to associate with the EC2 instances."
  type        = string
}