variable "vpc_id" {
  description = "VPC ID where the security group will be created. Leave null to use the AWS default VPC."
  type        = string
  default     = null
}

variable "sg_name" {
  description = "Security group name suffix."
  type        = string
}

variable "env" {
  description = "Deployment environment name."
  type        = string
}

variable "co_name" {
  description = "Company name prefix used for resource names and tags."
  type        = string
}

variable "ingress_rules" {
  description = "Ingress rules for the security group."
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

locals {
  tags = {
    env     = var.env
    co_name = var.co_name
    Name    = "${var.co_name}-${var.env}-${var.sg_name}"
  }
}
