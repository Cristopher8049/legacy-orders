output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.compute.public_ip
}

output "app_url" {
  description = "Application URL"
  value       = "http://${module.compute.public_ip}:${var.app_port}"
}