mod_nic = {
  "vm1" = {
    name                 = "nic1"
    location             = "centralindia"
    resource_group_name  = "rg-todoapp-dev"
    ip_name              = "Dynamic_private_IP"
    virtual_network_name = "vnet1"
    subnet_name          = "snet1"    
  }
}

mod_asg = {
  "asg" = {
    asg                 = "asg1"
    location            = "centralindia"
    resource_group_name = "rg-todoapp-dev"
  }
}

mod_nsg = {
  "nsg" = {
    nsg                 = "Rule1"
    location            = "centralindia"
    resource_group_name = "rg-todoapp-dev"
    subnet_name          = "snet1"
    virtual_network_name = "vnet1"
  }
}

mod_networking = {
  "networking1" = {
    name                = "vnet1"
    location            = "centralindia"
    resource_group_name = "rg-todoapp-dev"
    address_space       = ["10.0.0.0/16"]
    subnet_name         = "snet1"
    address_prefixes    = ["10.0.0.0/24"]
  }

  "networking2" = {
    name                = "vnet1"
    location            = "centralindia"
    resource_group_name = "rg-todoapp-dev"
    address_space       = ["10.0.0.0/16"]
    subnet_name         = "AzureBastionHostSubnet"
    address_prefixes    = ["10.0.1.0/24"]
  }
}

mod_firepoll = {
  "LB1" = {
    name = "firepolicy1"
    location             = "centralindia"
    resource_group_name  = "rg-todoapp-dev"
  }
}
