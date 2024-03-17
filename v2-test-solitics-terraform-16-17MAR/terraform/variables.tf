variable "aws_region_eu_west_1" {
  description = "AWS region for the first VPC (eu-west-1)"
  type        = string
  default     = "eu-west-1"
}

variable "aws_region_eu_west_2" {
  description = "AWS region for the second VPC (eu-west-2)"
  type        = string
  default     = "eu-west-2"
}

variable "region_eu_west_1_cidr_block" {
  description = "CIDR block for the VPC in the eu-west-1 region."
  type        = string
  default     = "10.0.0.0/16"
}

variable "region_eu_west_2_cidr_block" {
  description = "CIDR block for the VPC in the eu-west-2 region."
  type        = string
  default     = "10.1.0.0/16"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to deploy."
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "The ID of the subnet to deploy the EC2 instance in."
  type        = string
}

variable "key_name" {
  description = "The key name of the Key Pair to use for the EC2 instance."
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the EC2 instance."
  type        = list(string)
}

variable "iam_instance_profile_arn" {
  description = "The ARN of the IAM instance profile to associate with the EC2 instance."
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket to create."
  type        = string
  default     = "example-bucket-name-unique"
}

variable "aws_region" {
  description = "AWS region."
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "node_group_name" {
  description = "Name of the EKS node group."
  type        = string
}

variable "node_desired_size" {
  description = "Desired number of nodes in the EKS node group."
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum number of nodes in the EKS node group."
  type        = number
  default     = 3
}

variable "node_min_size" {
  description = "Minimum number of nodes in the EKS node group."
  type        = number
  default     = 1
}

variable "eks_version" {
  description = "Version of EKS cluster."
  type        = string
  default     = "1.20"
}

# CloudTrail specific variables
variable "cloudtrail_name" {
  description = "Name for the CloudTrail"
  type        = string
  default     = "example-trail"
}

# CloudWatch Log Group specific variables
variable "cloudwatch_log_group_name" {
  description = "Name for the CloudWatch Log Group"
  type        = string
  default     = "/aws/example/log-group"
}

# CloudWatch Metric Filter specific variables
variable "metric_filter_name" {
  description = "Name for the Metric Filter"
  type        = string
  default     = "example-metric-filter"
}

variable "metric_filter_pattern" {
  description = "Pattern for the Metric Filter"
  type        = string
  default     = "{$.userIdentity.type = Root}"
}

# CloudWatch Log Subscription Filter specific variables
variable "subscription_filter_name" {
  description = "Name for the Subscription Filter"
  type        = string
  default     = "example-subscription-filter"
}

variable "subscription_filter_pattern" {
  description = "Pattern for the Subscription Filter"
  type        = string
  default     = "{$.userIdentity.type = Root}"
}

# SNS Topic specific variables
variable "sns_topic_name" {
  description = "Name for the SNS Topic"
  type        = string
  default     = "example-sns-topic"
}

# Metric Alarm specific variables
variable "metric_alarm_name" {
  description = "Name for the Metric Alarm"
  type        = string
  default     = "example-metric-alarm"
}
