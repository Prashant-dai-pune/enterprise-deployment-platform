module "alb" {
  count = var.asg_max_size > 0 ? 1 : 0

  source = "../../Modules/alb/v1"

  name    = "app1-alb"
  co_name = var.co_name
  env     = var.env
  vpc_id  = local.selected_vpc_id

  subnet_ids = data.aws_subnets.public[0].ids

  security_group_ids = [module.alb_sg[0].security_group_id]

  health_check_path = "/"

  tags = {
    Name        = "${var.co_name}-${var.env}-app1-alb"
    Environment = var.env
    Application = "app1"
    ManagedBy   = "Terraform"
  }
}
