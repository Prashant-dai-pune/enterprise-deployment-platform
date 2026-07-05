variable "env" {
  //default = "vpc-5f680722"
  type    = string
  default = ""
}
variable "applications" {
  description = "Application deployment configuration"

  type = map(object({
    instance_count = number
  }))
}