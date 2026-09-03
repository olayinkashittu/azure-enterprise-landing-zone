resource "azurerm_policy_definition" "allowed_regions" {
  name         = "novasol-allowed-regions"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "NovaSol - Allowed Azure Regions"
  description  = "Restricts resource deployment to approved Azure regions for NovaSol Enterprise."

  metadata = jsonencode({
    category = "Governance"
    version  = "1.0.0"
  })

  parameters = jsonencode({
    allowedLocations = {
      type = "Array"

      metadata = {
        displayName = "Allowed Azure Regions"
        description = "The list of Azure regions where resources may be deployed."
      }
    }
  })

  policy_rule = file("${path.module}/policies/allowed-regions.json")
}