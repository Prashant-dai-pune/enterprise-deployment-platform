# Common variables per env
env    = "prd"
vpc_id = null

applications = {
  app1 = {
    instance_type     = "t2.micro"
    min_size          = 1
    desired_capacity  = 2
    max_size          = 4
  }
}
