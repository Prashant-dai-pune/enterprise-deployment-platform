variable "account_id" {
  description = "AWS account ID in which the GitHub Actions resources are created."
  type        = string
  default     = "410210732096"
}

variable "repository_owner" {
  description = "GitHub owner allowed to assume the GitHub Actions role."
  type        = string
  default     = "Prashant-dai-pune"
}

variable "repository_name" {
  description = "GitHub repository allowed to assume the GitHub Actions role."
  type        = string
  default     = "enterprise-deployment-platform"
}

variable "state_bucket_name" {
  description = "S3 bucket whose Terraform state is accessible to the GitHub Actions role."
  type        = string
  default     = "dev-edp-terraform-state-410210732096-us-east-1-an"
}

variable "state_key" {
  description = "Terraform state object key permitted to the GitHub Actions role."
  type        = string
  default     = "dev/terraform.tfstate"
}
