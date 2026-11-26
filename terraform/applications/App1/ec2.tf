module "app1_ec2" {
  source                 = "../../modules/Ec2/v1"
  env                    = var.env
  instance_count         = var.instance_count
  instance_type          = var.instance_type["${var.env}-${var.app_name}"]
  subnet_id              = var.instance_count > 0 ? sort(data.aws_subnets.public[0].ids)[0] : null
  key_name               = var.key_name
  vpc_security_group_ids = var.instance_count > 0 ? [module.app1_sg[0].security_group_id] : []
  unique_id              = var.app_name
  user_data              = <<-EOF
    #!/bin/bash
    set -eux
    dnf install -y httpd
    cat > /var/www/html/index.html <<'HTML'
    <!doctype html>
    <html><head><title>App1</title></head>
    <body><h1>App1 is running</h1><p>Served by Apache HTTP Server.</p></body></html>
    HTML
    systemctl enable --now httpd
  EOF
}
