module "alb" {

  source = "../../modules/alb/v1"

  name = "${var.co_name}-${var.env}-app1-alb"
  env  = var.env
  vpc_id = data.aws_vpc.default.id

  subnet_ids = [
    data.aws_subnet.public_subnet_1.id,
    data.aws_subnet.public_subnet_2.id
  ]

  security_group_id = module.alb_sg.security_group_id

  target_group_port     = 80
  target_group_protocol = "HTTP"

  listener_port     = 80
  listener_protocol = "HTTP"

  health_check_path = "/"

  tags = {
    Name        = "${var.co_name}-${var.env}-app1-alb"
    Environment = var.env
    Application = "app1"
    ManagedBy   = "Terraform"
  }
}