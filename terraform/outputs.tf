output "project_name" {
  description = "Name of the Azure Enterprise Landing Zone project"
  value       = var.project_name
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}

output "location" {
  description = "Azure region configured for the project"
  value       = var.location
}

output "owner" {
  description = "Team responsible for the resources"
  value       = var.owner
}
