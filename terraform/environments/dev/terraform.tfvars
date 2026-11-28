# Common variables per env
env    = "dev"
region = "us-east-1"
vpc_id = null

applications = {
  app1 = {
    instance_type    = "t3.micro"
    subnet_ids       = ["subnet-0478eb5f56ba85cb0", "subnet-09ba124f39acaaa99"]
    min_size         = 1
    desired_capacity = 2
    max_size         = 4
  }
}
