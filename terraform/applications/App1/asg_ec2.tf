module "app1_asg" {
  count  = var.asg_max_size > 0 ? 1 : 0
  source = "../../Modules/asg/v1"

  name                   = var.app_name
  env                    = var.env
  co_name                = var.co_name
  project_name           = var.project_name
  vpc_id                 = local.selected_vpc_id
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = var.instance_type
  min_size               = var.asg_min_size
  desired_capacity       = var.asg_desired_capacity
  max_size               = var.asg_max_size
  health_check_type      = "ELB"
  subnet_ids             = var.subnet_ids #sort(data.aws_subnets.public[0].ids)
  vpc_security_group_ids = [module.app1_sg[0].security_group_id]
  target_group_arns      = [module.alb[0].target_group_arn]
  key_name               = var.key_name
  user_data              = <<-EOF
    #!/bin/bash
    set -eux
    dnf install -y httpd
    TOKEN=$(curl -fsS -X PUT "http://169.254.169.254/latest/api/token" \
      -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
    PRIVATE_IP=$(curl -fsS \
      -H "X-aws-ec2-metadata-token: $TOKEN" \
      http://169.254.169.254/latest/meta-data/local-ipv4)
    cat > /var/www/html/index.html <<HTML
    <!doctype html>
    <html><head><title>App1</title></head>
    <body><h1>App1 is running</h1>
    <p>Served by Apache HTTP Server.</p>
    <p>Private IP: $${PRIVATE_IP}</p></body></html>
    HTML
    systemctl enable --now httpd
  EOF
}
