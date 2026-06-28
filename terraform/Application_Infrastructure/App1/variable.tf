variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = null
}
variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
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
variable "env" {
  description = "env details"
  type        = string
  default     = null
}


variable "unique_id" {
  description = "unique_id "
  type        = string
  default     = ""
  }


  variable "vpc_id" {
   //default = "vpc-5f680722"
   type = string
}

variable "env" {
   //default = "vpc-5f680722"
   type = string
}
variable "co_name" {
   //default = "vpc-5f680722"
   type = string
}
variable "master_role_name" {
   //default = "vpc-5f680722"
   type = string
}
variable "policy_name" {
   //default = "vpc-5f680722"
   type = string
}
variable "worker_role_name" {
   //default = "vpc-5f680722"
   type = string
}
variable "instance_profile_name" {
   //default = "vpc-5f680722"
   type = string
   }

 