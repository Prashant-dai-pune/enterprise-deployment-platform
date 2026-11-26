output "alb_dns_name" {
  description = "DNS name for the App1 load balancer."
  value       = module.alb.alb_dns_name
}

output "app_url" {
  description = "HTTP URL for App1."
  value       = "http://${module.alb.alb_dns_name}"
}
