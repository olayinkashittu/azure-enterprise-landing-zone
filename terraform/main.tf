terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "landing_zone" {
  name     = "rg-${lower(var.project_name)}-${lower(var.environment)}"
  location = var.location

  tags = {
    Environment = var.environment
    Department  = var.department
    Owner       = var.owner
    CostCenter  = var.cost_center
    Project     = var.project_name
  }
}