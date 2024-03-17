variable "eks_node_role_name" {}
variable "eks_cluster_role_name" {}
variable "custom_role_name" {}
variable "custom_policy_name" {}
// variable "custom_policy_document" {} // Remove this line

variable "s3_bucket_for_policy" {}

variable "custom_policy_document" {
  description = "The JSON policy document for the custom IAM policy"
  type        = string
  // Example or default value can be provided or omitted
}