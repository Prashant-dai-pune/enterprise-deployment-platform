data "aws_vpc" "default" {
  count   = var.instance_count > 0 && var.vpc_id == null ? 1 : 0
  default = true
}

locals {
  selected_vpc_id = var.vpc_id != null ? var.vpc_id : (var.instance_count > 0 ? data.aws_vpc.default[0].id : null)
}

data "aws_subnets" "public" {
  count = var.instance_count > 0 ? 1 : 0

  filter {
    name   = "vpc-id"
    values = [local.selected_vpc_id]
  }

  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
}
