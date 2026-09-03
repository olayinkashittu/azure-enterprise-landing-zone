resource "azurerm_management_group_policy_assignment" "allowed_regions" {
  name                 = "ns-allowed-regions"
  display_name         = "NovaSol - Allowed Azure Regions"
  policy_definition_id = azurerm_policy_definition.allowed_regions.id
  management_group_id  = "/providers/Microsoft.Management/managementGroups/novasol-root"

  parameters = jsonencode({
    allowedLocations = {
      value = [
        "northeurope",
        "westeurope"
      ]
    }
  })
}

resource "azurerm_management_group_policy_assignment" "required_tags" {
  name                 = "ns-required-tags"
  display_name         = "NovaSol - Required Resource Tags"
  policy_definition_id = azurerm_policy_definition.required_tags.id
  management_group_id  = "/providers/Microsoft.Management/managementGroups/novasol-root"
}
