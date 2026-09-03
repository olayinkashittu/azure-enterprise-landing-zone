variable "platform_principal_id" {
  description = "Object ID of the NovaSol platform administrator or service principal."
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

resource "azurerm_role_assignment" "platform_contributor" {
  scope                = "/providers/Microsoft.Management/managementGroups/novasol-root"
  role_definition_name = "Contributor"
  principal_id         = var.platform_principal_id
}
