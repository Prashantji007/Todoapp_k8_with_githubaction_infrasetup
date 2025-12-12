output "acr_name" {
  value = [ for v in azurerm_container_registry.acr_todoapp : v.name ]
}
