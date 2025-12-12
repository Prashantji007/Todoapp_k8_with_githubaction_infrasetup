resource "azurerm_user_assigned_identity" "aks_identity" {
    for_each = var.managed_identity
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}