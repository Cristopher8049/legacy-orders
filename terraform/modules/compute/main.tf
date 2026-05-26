resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.iam_instance_profile
  user_data              = var.user_data

  tags = {
    Name = "${var.project_name}-ec2"
  }
}