module "app1_ec2" {
  source         = "../../modules/ec2/v1"
  env            = var.env
  instance_count = var.instance_count
  instance_type  = var.instance_type["${var.env}-app1"]
  #vpc_security_group_ids = var.app1["vpc_security_group_ids"]
  unique_id = "app1"

}

