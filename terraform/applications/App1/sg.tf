module "app1_sg" {
  source  = "../../modules/sg/v1"
  vpc_id  = var.vpc_id
  sg_name = "${var.app_name}-sg"
  env     = var.env
  co_name = var.co_name

  ingress_rules = [
    {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = []
      source_security_group_id = module.alb_sg.security_group_id
    }
  ]
}

module "alb_sg" {

  source = "../../modules/sg/v1"

  co_name = var.co_name
  env     = var.env

  vpc_id  = data.aws_vpc.selected.id
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