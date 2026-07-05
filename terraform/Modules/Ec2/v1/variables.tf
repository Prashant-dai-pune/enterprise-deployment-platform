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
variable "instance_count" {
  description = "instance_count"
  type        = number
  default     = 0
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
  default     = "edp"
}
variable "env" {
  description = "env details"
  type        = string
  default     = null
}

variable "company_name" {
  description = "company_name "
  type        = string
  default     = "ftech"
}
variable "unique_id" {
  description = "unique_id "
  type        = string
  default     = ""
}
variable "user_data" {
  description = "user_data "
  type        = string
  default     = ""
}

variable "iam_instance_profile" {
  description = "iam_instance_profile"
  type        = string
  default     = ""
}
