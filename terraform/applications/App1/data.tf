data "aws_vpc" "default" {
  default = true
}

locals {
  selected_vpc_id = coalesce(var.vpc_id, data.aws_vpc.default.id)
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [local.selected_vpc_id]
  }

  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
}
