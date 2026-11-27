module "app1_sg" {
  count   = var.asg_max_size > 0 ? 1 : 0
  source  = "../../Modules/sg/v1"
  vpc_id  = local.selected_vpc_id
  sg_name = "${var.app_name}-sg"
  env     = var.env
  co_name = var.co_name

  ingress_rules = [
    {
      description              = "HTTP"
      from_port                = 80
      to_port                  = 80
      protocol                 = "tcp"
      cidr_blocks              = []
      source_security_group_id = module.alb_sg[0].security_group_id
    }
  ]
}

module "alb_sg" {
  count = var.asg_max_size > 0 ? 1 : 0

  source = "../../Modules/sg/v1"

  co_name = var.co_name
  env     = var.env

  vpc_id  = local.selected_vpc_id
  sg_name = "app1-alb-sg"

  ingress_rules = [
    {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
