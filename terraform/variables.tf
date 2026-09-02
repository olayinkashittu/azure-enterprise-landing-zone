variable "project_name" {
  description = "Name of the Azure Enterprise Landing Zone project"
  type        = string
  default     = "NovaSol"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "Production"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "West Europe"
}

variable "owner" {
  description = "Team responsible for the resources"
  type        = string
  default     = "CloudTeam"
}

variable "department" {
  description = "Department responsible for the resources"
  type        = string
  default     = "IT"
}

variable "cost_center" {
  description = "Cost center used for resource allocation"
  type        = string
  default     = "IT-001"
}


