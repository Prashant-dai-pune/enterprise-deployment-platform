module "app1_ec2" {
  source                 = "../../modules/Ec2/v1"
  env                    = var.env
  instance_count         = var.instance_count
  instance_type          = var.instance_type["${var.env}-${var.app_name}"]
  vpc_security_group_ids = [module.app1_sg.security_group_id]
  unique_id              = var.app_name
}
