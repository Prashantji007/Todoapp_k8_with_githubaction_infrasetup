mod_rgs = {
  rg1 = {
    rg_name  = "rg-todoapp-dev"
    location = "centralindia"
    tags = {
      Environment = "Development"
      Owner       = "Prashant"
    }
  }
}

mod_aks = {
  aks1 = {
    aks_name            = "aks-todoapp-dev01"
    location            = "centralindia"
    resource_group_name = "rg-todoapp-dev"
    tags = {
      Environment = "Development"
      Owner       = "Prashant"
    }
  }
}

mod_acr = {
  acr1 = {
    acr_name            = "acrtodoappdev01"
    location            = "centralindia"
    resource_group_name = "rg-todoapp-dev"
  }
}

mod_mssql_server = {
  mssql1 = {
    mssql_server_name            = "mssqldbserverdev"
    location                     = "centralindia"
    resource_group_name          = "rg-todoapp-dev"
    administrator_login_username = "sqladminuser"
    administrator_login_password = "Test@12345"
    tags = {
      Environment = "Development"
      Owner       = "Prashant"
    }
  }
}
mod_mssql_db = {
  db1 = {
    mssql_server_name = "mssqldbserverdev"
    mssql_db_name     = "sqldbdev"
    sku_name          = "S0"
    tags = {
      Environment = "Development"
      Owner       = "Prashant"
    }
  }
}
mod_kv = {
  kv1 = {
    kv_name             = "kvtodoappdev"
    location            = "centralindia"
    resource_group_name = "rg-todoapp-dev"
    tags = {
      Environment = "Development"
      Owner       = "Prashant"
    }
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


mod_vm = {
  "vm1" = {
    name                = "vm1"
    location            = "centralindia"
    resource_group_name = "rg-todoapp-dev"
    size                = "Standard_b1s"
    admin_username      = "babu"
  }
}

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

mod_bastion_host = {
  "bh1" = {
    name                 = "bastion_host1"
    location             = "centralindia"
    resource_group_name  = "rg-todoapp-dev"
    virtual_network_name = "vnet1"
    subnet_name          = "snAzureBastionHostSubnetet1"
    pip_name             = "pip_bastionhost"
  }
}

mod_stg = {
  "stg1" = {
    name = "storg1"
    location             = "centralindia"
    resource_group_name  = "rg-todoapp-dev"
  }
}

mod_logs = {
  "log" = {
    name = "logcheck"
    location             = "centralindia"
    resource_group_name  = "rg-todoapp-dev"
  }
}

mod_monitor = {
  "monitoring" = {
    name = "monitoring_sol"
    location             = "centralindia"
    resource_group_name  = "rg-todoapp-dev"
}
}