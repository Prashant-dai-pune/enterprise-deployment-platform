resource "aws_instance" "myec2" {
  count                       = var.instance_count
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.subnet_id == null ? null : true
  vpc_security_group_ids      = var.vpc_security_group_ids
  key_name                    = var.key_name
  user_data                   = var.user_data
  iam_instance_profile        = var.iam_instance_profile
  tags = {
    Name         = "${var.company_name}-${var.project_name}-${var.unique_id}"
    project_name = "edp"
    env          = var.env
  }
}
