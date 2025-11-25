resource "azurerm_kubernetes_cluster" "aks_todoapp" {
    for_each = var.aks
  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = "todoaks1"


    default_node_pool {
      name       = "todonp"
      node_count = 1
      vm_size    = "Standard_B2ms"
      temporary_name_for_rotation = "tempnodepool"  
      os_disk_size_gb = 30
      os_disk_type     = "Managed"  
    }

network_profile {
    load_balancer_sku = "standard"      
    network_plugin = "kubenet"
  }

  

  identity {
    type = "SystemAssigned"
  }

  tags = each.value.tags
}

