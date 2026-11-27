output "alb_dns_name" {
  description = "DNS name for the App1 load balancer."
  value       = var.asg_max_size > 0 ? module.alb[0].alb_dns_name : null
}

output "app_url" {
  description = "HTTP URL for App1."
  value       = var.asg_max_size > 0 ? "http://${module.alb[0].alb_dns_name}" : null
}
