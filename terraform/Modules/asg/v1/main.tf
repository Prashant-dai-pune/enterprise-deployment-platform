locals {
  resource_name = "${var.co_name}-${var.env}-${var.name}"
  vpc_id        = var.vpc_id == null ? data.aws_vpc.default[0].id : var.vpc_id
  subnet_ids    = length(var.subnet_ids) == 0 ? data.aws_subnets.selected[0].ids : var.subnet_ids

  tags = merge(
    {
      Name         = local.resource_name
      env          = var.env
      co_name      = var.co_name
      project_name = var.project_name
    },
    var.tags
  )
}

resource "aws_launch_template" "this" {
  name_prefix            = "${local.resource_name}-"
  image_id               = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = var.user_data == "" ? null : base64encode(var.user_data)

  dynamic "iam_instance_profile" {
    for_each = var.iam_instance_profile == "" ? [] : [var.iam_instance_profile]

    content {
      name = iam_instance_profile.value
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags          = local.tags
  }

  tags = local.tags
}

resource "aws_autoscaling_group" "this" {
  name                = local.resource_name
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = local.subnet_ids
  target_group_arns   = var.target_group_arns
  health_check_type   = var.health_check_type

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  dynamic "tag" {
    for_each = local.tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}
