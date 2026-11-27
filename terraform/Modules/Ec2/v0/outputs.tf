output "instance_ids" {
  description = "IDs of the EC2 instances created by this module"
  value       = aws_instance.myec2[*].id
}
