output "flow_log_id" {
  description = "ID of the VPC Flow Log"
  value       = aws_flow_log.vpc.id
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket storing flow logs"
  value       = aws_s3_bucket.flow_logs.id
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket storing flow logs"
  value       = aws_s3_bucket.flow_logs.arn
}