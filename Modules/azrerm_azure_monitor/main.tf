resource "azurerm_monitor_workspace" "example" {
    for_each = var.monitor
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  tags = {
    environment = "dev"
  }
}