module "eks-sgs" {
    source     = "../../modules/sg/v0"
    vpc_id     = var.vpc_id
    sg_name    = var.sg_name
    env        = var.env
    co_name    = var.co_name
  }



  
  