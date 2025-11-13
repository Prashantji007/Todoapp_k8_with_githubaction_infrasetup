resource "azurerm_policy_definition" "policy_definition" {
    for_each = var.policy
  name         = each.value.name
  policy_type  = each.value.policy_type
  mode         = each.value.mode
  display_name = each.value.display_name
  description  = each.value.description
  policy_rule = each.value.policy_rule
}




resource "azurerm_policy_set_definition" "baseline" {
    for_each = var.policy
  name         = each.value.name_policy_set
  display_name = each.value.display_name_policy_set
  policy_type = each.value.policy_type
  description  = each.value.description_policy_set

  dynamic "policy_definition_reference" {
    for_each = azurerm_policy_definition.policy_definition
    content {
      policy_definition_id = policy_definition_reference.value.id
    }
  }
  
}

data "azurerm_management_group" "landing" {
    for_each = var.policy
    name = each.value.mgmt_name
}

resource "azurerm_management_group_policy_assignment" "baseline_assign" {
    for_each = var.policy
  name                 = "org-baseline-assignment"
  management_group_id  = data.azurerm_management_group.landing[each.key].id
  display_name         = "Baseline assignment at LandingMG"
  policy_definition_id = azurerm_policy_set_definition.baseline[each.key].id
  description = "Baseline controls for all resources under Landing"
}
