output "asg_name" {
  description = "Name of the autoscaling group."
  value       = aws_autoscaling_group.this.name
}

output "asg_arn" {
  description = "ARN of the autoscaling group."
  value       = aws_autoscaling_group.this.arn
}

output "launch_template_id" {
  description = "ID of the launch template."
  value       = aws_launch_template.this.id
}
