output "rg_name" {
  value = [for  v in azurerm_resource_group.rg_todoapp : v.name ]
}

output "location" {
  value = { for k, rg in azurerm_resource_group.rg_todoapp : k => rg.location }
}

output "tags" {
  value = { for k, rg in azurerm_resource_group.rg_todoapp : k => rg.tags }
}
