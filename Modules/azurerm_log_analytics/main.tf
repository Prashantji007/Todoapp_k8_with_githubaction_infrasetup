resource "azurerm_log_analytics_workspace" "logs" {
    for_each = var.logs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}