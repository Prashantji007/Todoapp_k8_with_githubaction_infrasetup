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
    uai_name = "aks-uai-dev"
  }
}

mod_bastion_host = {
  "bh1" = {
    name                 = "bastion_host1"
    location             = "centralindia"
    resource_group_name  = "rg-todoapp-dev"
    virtual_network_name = "vnet1"
    subnet_name          = "AzureBastionHostSubnet"
    pip_name             = "pip_bastionhost"
  }
}

mod_stg = {
  "stg1" = {
    name = "storg167"
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
    name = "monitoring-sol"
    location             = "centralindia"
    resource_group_name  = "rg-todoapp-dev"
}
}

mod_LB = {
  "LB1" = {
    name = "LB-App-Gatway"
    location             = "centralindia"
    resource_group_name  = "rg-todoapp-dev"
    virtual_network_name = "vnet1"
     subnet_name         = "snet1"
  }
}
db_connection_string = "Demo_Cponnection_String"
