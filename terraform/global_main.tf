module "app1" {
  source         = "./applications/App1"
  env            = var.env
  instance_count = var.applications["app1"].instance_count
}