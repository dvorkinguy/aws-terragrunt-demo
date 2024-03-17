output "cloudtrail_id" {
  value       = aws_cloudtrail.example_trail.id
  description = "The ID of the CloudTrail trail."
}

output "cloudwatch_log_group_name" {
  value       = aws_cloudwatch_log_group.example_log_group.name
  description = "The name of the CloudWatch Log Group."
}

output "cloudwatch_log_metric_filter_id" {
  value       = aws_cloudwatch_log_metric_filter.example_metric_filter.id
  description = "The ID of the CloudWatch Log Metric Filter."
}

output "cloudwatch_log_subscription_filter_id" {
  value       = aws_cloudwatch_log_subscription_filter.example_subscription_filter.id
  description = "The ID of the CloudWatch Log Subscription Filter."
}

output "s3_bucket_id" {
  value       = aws_s3_bucket.cloudtrail_logs.id
  description = "The ID of the S3 bucket."
}

