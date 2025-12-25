data "azurerm_subnet" "datasubnet" {
  for_each = var.LB
  name = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}

# data "azurerm_web_application_firewall_policy" "datafire" {
#   for_each = var.LB
#   name = "firepoll"
#   resource_group_name = each.value.resource_group_name
# }


resource "azurerm_public_ip" "pip-lb" {
    for_each = var.LB
    name = "LB_PIP"
    location = each.value.location
    allocation_method = "Static"
    resource_group_name = each.value.resource_group_name
}

resource "azurerm_application_gateway" "network" {
    for_each = var.LB
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  firewall_policy_id = var.waf_policy_id[each.key]

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = data.azurerm_subnet.datasubnet[each.key].id
  }

  frontend_port {
    name = "${each.value.virtual_network_name}-fronfeport"
    port = 80
  }


  frontend_ip_configuration {
    name                 = "${each.value.virtual_network_name}-feip"
    public_ip_address_id = azurerm_public_ip.pip-lb[each.key].id
  }

  backend_address_pool {
    name = "${each.value.virtual_network_name}-beap"
  }

  backend_http_settings {
    name                  = "${each.value.virtual_network_name}-be-htst"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "${each.value.virtual_network_name}-httplstn"
    frontend_ip_configuration_name = "${each.value.virtual_network_name}-feip"
    frontend_port_name             = "${each.value.virtual_network_name}-fronfeport"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${each.value.virtual_network_name}-rqrt"
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = "${each.value.virtual_network_name}-httplstn"
    backend_address_pool_name  = "${each.value.virtual_network_name}-beap"
    backend_http_settings_name = "${each.value.virtual_network_name}-be-htst"
  }

   waf_configuration {
    enabled                  = true
    firewall_mode            = "Prevention"
    rule_set_type            = "OWASP"
    rule_set_version         = "3.2"
  }
}