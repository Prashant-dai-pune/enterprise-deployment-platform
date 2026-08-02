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

variable "vpc_id" {
  description = "VPC ID where application resources will be created. Leave null to use the AWS default VPC."
  type        = string
  default     = null
}

variable "applications" {
  description = "Application deployment configuration"

  type = map(object({
    instance_count = number
  }))
}
