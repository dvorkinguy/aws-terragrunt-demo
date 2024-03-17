output "iam_role_arn" {
  value       = aws_iam_role.solitics-example_role.arn
  description = "The ARN of the IAM role"
}

output "iam_policy_arn" {
  value       = aws_iam_policy.solitics-example_policy.arn
  description = "The ARN of the IAM policy"
}


