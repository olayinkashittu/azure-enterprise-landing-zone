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

locals {
  common_tags = {
    Environment = var.environment
    Department  = var.department
    Owner       = var.owner
    CostCenter  = var.cost_center
    Project     = var.project_name
  }
}

resource "azurerm_resource_group" "landing_zone" {
  name     = "rg-${lower(var.project_name)}-${lower(var.environment)}"
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "network" {
  name     = "rg-${lower(var.project_name)}-${lower(var.environment)}-network"
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "application" {
  name     = "rg-${lower(var.project_name)}-${lower(var.environment)}-app"
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "data" {
  name     = "rg-${lower(var.project_name)}-${lower(var.environment)}-data"
  location = var.location
  tags     = local.common_tags
}