variable "name" {
  description = "Name prefix for ASG resources."
  type        = string
}

variable "instance_type" {
  description = "The instance type used by the launch template."
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Minimum number of instances in the ASG."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances in the ASG."
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "Desired number of instances in the ASG."
  type        = number
  default     = 1
}

variable "vpc_id" {
  description = "VPC ID where ASG instances will be created. Leave null to use the AWS default VPC."
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "Subnet IDs for ASG instances. Leave empty to use all subnets in the selected VPC."
  type        = list(string)
  default     = []
}

variable "vpc_security_group_ids" {
  description = "Security group IDs attached to ASG instances."
  type        = list(string)
}

variable "target_group_arns" {
  description = "Target group ARNs attached to the ASG."
  type        = list(string)
  default     = []
}

variable "key_name" {
  description = "Key pair name used by instances."
  type        = string
  default     = "dipmaha1"
}

variable "user_data" {
  description = "User data script passed to instances."
  type        = string
  default     = ""
}

variable "iam_instance_profile" {
  description = "IAM instance profile name."
  type        = string
  default     = ""
}

variable "health_check_type" {
  description = "Health check type for the ASG."
  type        = string
  default     = "ELB"
}

variable "env" {
  description = "Deployment environment name."
  type        = string
}

variable "co_name" {
  description = "Company name prefix used for resource names and tags."
  type        = string
}

variable "project_name" {
  description = "Name of the project."
  type        = string
  default     = "edp"
}

variable "tags" {
  description = "Additional tags for ASG resources."
  type        = map(string)
  default     = {}
}
