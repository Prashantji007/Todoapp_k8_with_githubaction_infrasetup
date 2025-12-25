data "azurerm_user_assigned_identity" "uai" {
  for_each = var.aks
  name = each.value.uai_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_application_gateway" "data_gateway" {
  for_each = var.aks
  name = "LB-App-Gatway"
  resource_group_name = each.value.resource_group_name
}

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

  ingress_application_gateway {
    gateway_id = data.azurerm_application_gateway.data_gateway[each.key].id
  }
  

  # identity {
  #   type = "SystemAssigned"
  # }

 identity {
  type = "UserAssigned"
  identity_ids = [
    data.azurerm_user_assigned_identity.uai[each.key].id
  ]
}


  tags = each.value.tags
}



resource "azurerm_role_assignment" "agic_on_appgw" {
  for_each = var.aks
  scope                = data.azurerm_application_gateway.data_gateway[each.key].id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_user_assigned_identity.uai[each.key].principal_id
}
