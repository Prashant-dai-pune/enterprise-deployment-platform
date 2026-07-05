variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = null
}
variable "instance_type" {
  description = "The type of instance to start"
  type        = map(any)
  default = {
    dev-app1 = "t2.micro",
    stg-app1 = "t2.micro",
    prd-app1 = "t2.micro"
  }
}
variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}
variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}
variable "name" {
  description = "name of the instance."
  type        = string
  default     = null
}
variable "project_name" {
  description = "name of the project"
  type        = string
  default     = null
}


variable "instance_count" {
  description = "instance_count "
  type        = number
  default     = 0
}
variable "unique_id" {
  description = "unique_id "
  type        = string
  default     = ""
}


variable "vpc_id" {
  //default = "vpc-5f680722"
  type    = string
  default = ""
}

variable "env" {
  //default = "vpc-5f680722"
  type    = string
  default = ""
}
variable "co_name" {
  //default = "vpc-5f680722"
  type    = string
  default = ""
}
variable "master_role_name" {
  //default = "vpc-5f680722"
  type    = string
  default = ""
}
variable "policy_name" {
  //default = "vpc-5f680722"
  type    = string
  default = ""
}
variable "worker_role_name" {
  //default = "vpc-5f680722"
  type    = string
  default = ""
}
variable "instance_profile_name" {
  //default = "vpc-5f680722"
  type    = string
  default = ""
}

 