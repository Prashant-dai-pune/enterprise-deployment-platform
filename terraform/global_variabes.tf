variable "env" {
  description = "Deployment environment name."
  type        = string
  default     = ""
}

variable "co_name" {
  description = "Company name prefix used for resource names and tags."
  type        = string
  default     = "ftech"
}

variable "region" {
  description = "AWS region used by the provider."
  type        = string
  default     = "us-east-1"
}
variable "subnet_ids" {
  description = "Subnet IDs for ASG instances. Leave empty to use all subnets in the selected VPC."
  type        = list(string)
  default     = []
}
variable "vpc_id" {
  description = "VPC ID where application resources will be created. Leave null to use the AWS default VPC."
  type        = string
  default     = null
}

variable "applications" {
  description = "Application deployment configuration"

  type = map(object({
    instance_type    = string
    subnet_ids       = list(string)
    min_size         = number
    desired_capacity = number
    max_size         = number
  }))
}
