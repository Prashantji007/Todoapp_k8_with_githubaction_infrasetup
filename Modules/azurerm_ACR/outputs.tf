output "acr_name" {
  value = { for k, v in azurerm_container_registry.acr_todoapp : k => v.name }

}
