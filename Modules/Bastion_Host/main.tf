data "azurerm_subnet" "datasubnet" {
  for_each = var.bastion_host
  name = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}



resource "azurerm_public_ip" "pip" {
    for_each = var.bastion_host
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
}

resource "azurerm_bastion_host" "host" {
    for_each = var.bastion_host
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "ip_config"
    subnet_id            = data.azurerm_subnet.datasubnet[each.key].id
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}