variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "app_port" {
  description = "Application port"
  type        = number
}

variable "repo_url" {
  description = "GitHub repository URL"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
}

variable "allowed_cidr" {
  description = "Allowed CIDR for inbound application traffic"
  type        = string
}