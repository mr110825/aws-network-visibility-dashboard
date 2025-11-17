output "alb_dns_name" {
  description = "ALB DNS name"
  value       = module.alb.alb_dns_name
}

output "alb_logs_bucket" {
  description = "S3 bucket for ALB access logs"
  value       = module.alb.alb_logs_bucket
}