data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_vpc" "default" {
  count   = var.asg_max_size > 0 && var.vpc_id == null ? 1 : 0
  default = true
}

locals {
  selected_vpc_id = var.vpc_id != null ? var.vpc_id : (var.asg_max_size > 0 ? data.aws_vpc.default[0].id : null)
}

data "aws_subnets" "public" {
  count = var.asg_max_size > 0 ? 1 : 0

  filter {
    name   = "vpc-id"
    values = [local.selected_vpc_id]
  }

  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
}
