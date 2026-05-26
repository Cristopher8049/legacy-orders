data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

locals {
  user_data = templatefile("${path.module}/user_data.sh", {
    app_port = var.app_port
    repo_url = var.repo_url
  })
}

module "network" {
  source       = "./modules/network"
  project_name = var.project_name
  app_port     = var.app_port
  allowed_cidr = var.allowed_cidr
}

module "compute" {
  source               = "./modules/compute"
  project_name         = var.project_name
  ami_id               = data.aws_ami.amazon_linux_2023.id
  instance_type        = var.instance_type
  security_group_id    = module.network.security_group_id
  iam_instance_profile = var.iam_instance_profile
  user_data            = local.user_data
}