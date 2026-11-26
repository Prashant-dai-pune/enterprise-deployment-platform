module "alb" {

  source = "../../modules/alb/v1"

  name    = "${var.co_name}-${var.env}-app1-alb"
  co_name = var.co_name
  env     = var.env
  vpc_id  = local.selected_vpc_id

  subnet_ids = data.aws_subnets.public.ids

  security_group_ids = module.alb_sg.security_group_id

  #target_group_port     = 80
  #target_group_protocol = "HTTP"

  #listener_port     = 80
  #listener_protocol = "HTTP"

  health_check_path = "/"

  tags = {
    Name        = "${var.co_name}-${var.env}-app1-alb"
    Environment = var.env
    Application = "app1"
    ManagedBy   = "Terraform"
  }
}
