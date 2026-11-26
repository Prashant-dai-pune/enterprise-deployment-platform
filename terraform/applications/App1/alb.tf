module "alb" {
  count = var.instance_count > 0 ? 1 : 0

  source = "../../modules/alb/v1"

  name    = "app1-alb"
  co_name = var.co_name
  env     = var.env
  vpc_id  = local.selected_vpc_id

  subnet_ids = data.aws_subnets.public[0].ids

  security_group_ids = [module.alb_sg[0].security_group_id]

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

resource "aws_lb_target_group_attachment" "app1" {
  count            = var.instance_count
  target_group_arn = module.alb[0].target_group_arn
  target_id        = module.app1_ec2.instance_ids[count.index]
  port             = 80
}
