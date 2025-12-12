output "acr_name" {
  value = [ for v in azurerm_kubernetes_cluster.aks_todoapp : v.name ]
}
