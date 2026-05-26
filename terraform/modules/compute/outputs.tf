output "public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.app.public_ip
}