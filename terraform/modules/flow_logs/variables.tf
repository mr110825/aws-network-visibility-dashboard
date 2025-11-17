variable "vpc_id" {
  description = "VPC ID to enable flow logs"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name for flow logs"
  type        = string
}

variable "traffic_type" {
  description = "Type of traffic to log (ACCEPT, REJECT, or ALL)"
  type        = string
  default     = "ALL"

  validation {
    condition     = contains(["ACCEPT", "REJECT", "ALL"], var.traffic_type)
    error_message = "traffic_type must be ACCEPT, REJECT, or ALL"
  }
}

variable "log_retention_days" {
  description = "Number of days to retain flow logs"
  type        = number
  default     = 30
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}