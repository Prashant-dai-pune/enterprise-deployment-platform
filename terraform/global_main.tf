module "app1" {
  source         = "./applications/App1"
  app_name       = "app1"
  env            = var.env
  co_name        = var.co_name
  vpc_id         = var.vpc_id
  instance_count = var.applications["app1"].instance_count
}
