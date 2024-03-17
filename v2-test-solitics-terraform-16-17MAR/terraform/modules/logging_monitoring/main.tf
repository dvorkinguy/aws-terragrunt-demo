resource "random_pet" "name" {
  length    = 2
  separator = "-"
}

resource "aws_s3_bucket" "cloudtrail_logs" {
  bucket = "example-cloudtrail-logs-${random_pet.name.id}"
  acl    = "private"

  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    actions   = ["s3:GetBucketAcl"]
    resources = [aws_s3_bucket.cloudtrail_logs.arn]
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
  }

  statement {
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.cloudtrail_logs.arn}/*"]
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }
}

resource "aws_cloudtrail" "example_trail" {
  name                          = var.cloudtrail_name
  s3_bucket_name                = aws_s3_bucket.cloudtrail_logs.bucket
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true

  event_selector {
    read_write_type           = "All"
    include_management_events = true
  }
}

resource "aws_cloudwatch_log_group" "example_log_group" {
  name              = var.cloudwatch_log_group_name
  retention_in_days = 90
}

resource "aws_cloudwatch_log_metric_filter" "example_metric_filter" {
  name           = var.metric_filter_name
  pattern        = var.metric_filter_pattern
  log_group_name = aws_cloudwatch_log_group.example_log_group.name

  metric_transformation {
    name      = "ExampleMetricFilter"
    namespace = "CWL/Example"
    value     = "1"
  }
}

resource "aws_sns_topic" "example" {
  name = var.sns_topic_name
}

resource "aws_cloudwatch_log_subscription_filter" "example_subscription_filter" {
  name            = var.subscription_filter_name
  log_group_name  = aws_cloudwatch_log_group.example_log_group.name
  filter_pattern  = var.subscription_filter_pattern
  destination_arn = aws_sns_topic.example.arn
}

resource "aws_cloudwatch_metric_alarm" "example_metric_alarm" {
  alarm_name          = var.metric_alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "ExampleMetricFilter"
  namespace           = "CWL/Example"
  period              = 300
  statistic           = "Sum"
  threshold           = "1"

  alarm_description = "This metric monitors the example metric filter."
  alarm_actions     = [aws_sns_topic.example.arn]

  dimensions = {
    LogGroupName = aws_cloudwatch_log_group.example_log_group.name
  }

  treat_missing_data = "notBreaching"
}

# Define variables in the root module
variable "cloudtrail_name" {}
variable "s3_bucket_name" {}
variable "cloudwatch_log_group_name" {}
variable "metric_filter_name" {}
variable "metric_filter_pattern" {}
variable "subscription_filter_name" {}
variable "subscription_filter_pattern" {}
variable "sns_topic_name" {}
variable "metric_alarm_name" {}

