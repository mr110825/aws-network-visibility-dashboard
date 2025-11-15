variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "aws-network-visibility"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
