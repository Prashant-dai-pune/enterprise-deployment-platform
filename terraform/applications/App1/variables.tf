variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "The EC2 instance type used by App1's ASG launch template."
  type        = string
  default     = "t3.micro"
}

variable "asg_min_size" {
  description = "Minimum number of App1 instances."
  type        = number
  default     = 1
}

variable "asg_desired_capacity" {
  description = "Desired number of App1 instances."
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "Maximum number of App1 instances."
  type        = number
  default     = 4
}

variable "app_name" {
  description = "Application name used for naming and tagging App1 resources."
  type        = string
  default     = "app1"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource"
  type        = string
  default     = null
}

variable "name" {
  description = "Name of the instance."
  type        = string
  default     = null
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "edp"
}

variable "unique_id" {
  description = "Unique identifier for resources."
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "VPC ID where App1 resources will be created. Leave null to use the AWS default VPC."
  type        = string
  default     = null
}

variable "env" {
  description = "Deployment environment name."
  type        = string
  default     = ""
}

variable "co_name" {
  description = "Company name prefix used for App1 resource names and tags."
  type        = string
  default     = "ftech"
}

variable "master_role_name" {
  type    = string
  default = ""
}

variable "policy_name" {
  type    = string
  default = ""
}

variable "worker_role_name" {
  type    = string
  default = ""
}

variable "instance_profile_name" {
  type    = string
  default = ""
}
