resource "azurerm_kubernetes_cluster" "aks_todoapp" {
    for_each = var.aks
  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = "todoaks1"

  default_node_pool {
    name       = "todonp"
    node_count = 1
    vm_size    = "standard_a2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = each.value.tags
}

