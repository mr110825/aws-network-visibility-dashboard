output "alb_dns_name" {
  description = "ALB DNS name"
  value       = module.alb.alb_dns_name
}

output "alb_logs_bucket" {
  description = "S3 bucket for ALB access logs"
  value       = module.alb.alb_logs_bucket
}

# Flow Logs Outputs
output "flow_log_id" {
  description = "VPC Flow Log ID"
  value       = module.flow_logs.flow_log_id
}

output "flow_logs_bucket_name" {
  description = "S3 bucket name for flow logs"
  value       = module.flow_logs.s3_bucket_name
}

output "flow_logs_bucket_arn" {
  description = "S3 bucket ARN for flow logs"
  value       = module.flow_logs.s3_bucket_arn
}