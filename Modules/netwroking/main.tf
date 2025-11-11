

resource "azurerm_virtual_network" "vn" {
    for_each = var.vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space

dynamic "subnet" {
  for_each = var.vnet
  content {
    name = each.value.subnet_name
    address_prefixes = each.value.address_prefixes
  }
}

  tags = {
    environment = "Production"
  }
}


resource "azurerm_network_security_group" "nsg" {
    for_each = var.vnet
  name                = each.value.nsg
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

   security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "dev"
  }
}


resource "azurerm_application_security_group" "asg" {
    for_each = var.vnet
  name                = each.value.asg
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  tags = {
    environment = "dev"
  }
}