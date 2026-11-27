module "app1" {
  source         = "./applications/App1"
  app_name       = "app1"
  env            = var.env
  co_name        = var.co_name
  vpc_id         = var.vpc_id
  subnet_ids     = var.applications["app1"].subnet_ids
  instance_type          = var.applications["app1"].instance_type
  asg_min_size           = var.applications["app1"].min_size
  asg_desired_capacity   = var.applications["app1"].desired_capacity
  asg_max_size           = var.applications["app1"].max_size
}
