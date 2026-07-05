# Common Varibales per env
env     = "prd"
co_name = ""
vpc_id  = ""


applications = {

  App1 = {

    version = "2.1"

    color = "blue"

    desired_capacity = 2

    enabled = true
  }

  App2 = {

    version = "3.9"

    enabled = true
  }

  App3 = {

    version = "1.13"

    enabled = false
  }
}