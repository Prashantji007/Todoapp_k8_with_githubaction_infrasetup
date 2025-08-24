resource "azurerm_resource_group" "rg_todoapp" {
  for_each = var.rgs
  name     = each.value.rg_name
  location = each.value.location
  tags    = each.value.tags 
}