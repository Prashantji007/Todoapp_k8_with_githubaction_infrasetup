output "aks_name" {
  value = { for k, v in azurerm_kubernetes_cluster.aks_todoapp : k => v.name }
}

