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

output "landing_zone_resource_group" {
  description = "Name of the primary landing zone resource group"
  value       = azurerm_resource_group.landing_zone.name
}

output "network_resource_group" {
  description = "Name of the network resource group"
  value       = azurerm_resource_group.network.name
}

output "application_resource_group" {
  description = "Name of the application resource group"
  value       = azurerm_resource_group.application.name
}

output "data_resource_group" {
  description = "Name of the data resource group"
  value       = azurerm_resource_group.data.name
}