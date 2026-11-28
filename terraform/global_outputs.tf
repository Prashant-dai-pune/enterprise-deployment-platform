output "github_oidc_provider_arn" {
  description = "ARN of the GitHub Actions OIDC provider in the Dev environment."
  value       = var.env == "dev" ? module.github_actions[0].oidc_provider_arn : null
}

output "github_actions_role_arn" {
  description = "ARN of the GitHub Actions Terraform role in the Dev environment."
  value       = var.env == "dev" ? module.github_actions[0].role_arn : null
}

output "github_actions_role_name" {
  description = "Name of the GitHub Actions Terraform role in the Dev environment."
  value       = var.env == "dev" ? module.github_actions[0].role_name : null
}
