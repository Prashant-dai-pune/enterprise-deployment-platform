locals {
  vpc_id     = var.vpc_id == null ? data.aws_vpc.default[0].id : var.vpc_id
  subnet_ids = length(var.subnet_ids) == 0 ? data.aws_subnets.selected[0].ids : var.subnet_ids

  tags = merge(
    {
      Name    = "${var.co_name}-${var.env}-${var.name}"
      env     = var.env
      co_name = var.co_name
    },
    var.tags
  )
}

resource "aws_lb" "this" {
  name               = "${var.co_name}-${var.env}-${var.name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = local.subnet_ids

  tags = local.tags
}

resource "aws_lb_target_group" "this" {
  name        = "${var.co_name}-${var.env}-${var.name}-tg"
  port        = var.target_port
  protocol    = var.target_protocol
  target_type = "instance"
  vpc_id      = local.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200-399"
    path                = var.health_check_path
    protocol            = var.target_protocol
    timeout             = 5
    unhealthy_threshold = 2
  }

  tags = local.tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  tags = local.tags
}
