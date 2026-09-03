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
resource "azurerm_policy_definition" "required_tags" {
  name         = "novasol-required-tags"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "NovaSol - Required Resource Tags"
  description  = "Requires Environment, Owner, and CostCenter tags on NovaSol Enterprise resources."

  metadata = jsonencode({
    category = "Governance"
    version  = "1.0.0"
  })

  policy_rule = file("${path.module}/policies/required-tags.json")
}
