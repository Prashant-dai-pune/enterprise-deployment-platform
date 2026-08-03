variable "name" {
  description = "Name prefix for ALB resources."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ALB resources will be created. Leave null to use the AWS default VPC."
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "Subnet IDs for the ALB. Leave empty to use all subnets in the selected VPC."
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Security group IDs attached to the ALB."
  type        = list(string)
}

variable "target_port" {
  description = "Port where application targets receive traffic."
  type        = number
  default     = 80
}

variable "target_protocol" {
  description = "Protocol where application targets receive traffic."
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Path used by the target group health check."
  type        = string
  default     = "/"
}

variable "env" {
  description = "Deployment environment name."
  type        = string
}

variable "co_name" {
  description = "Company name prefix used for resource names and tags."
  type        = string
}

variable "tags" {
  description = "Additional tags for ALB resources."
  type        = map(string)
  default     = {}
}
