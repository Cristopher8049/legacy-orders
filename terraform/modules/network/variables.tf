variable "project_name" {
  description = "Project name"
  type        = string
}

variable "app_port" {
  description = "Application port"
  type        = number
}

variable "allowed_cidr" {
  description = "Allowed CIDR for inbound traffic"
  type        = string
}