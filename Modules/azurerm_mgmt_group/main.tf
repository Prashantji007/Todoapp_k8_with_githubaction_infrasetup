data "azurerm_subscription" "current" {
}

resource "azurerm_management_group" "mgmt_LZ" {
    for_each = var.mgmt
  display_name = each.value.display_name
  subscription_ids = [
    data.azurerm_subscription.current.subscription_id
  ]
}

