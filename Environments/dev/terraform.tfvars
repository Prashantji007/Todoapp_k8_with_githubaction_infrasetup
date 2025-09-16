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
        aks_name             = "aks-todoapp-dev01"
        location             = "centralindia"
        resource_group_name  = "rg-todoapp-dev"
        tags = {
      Environment = "Development"
      Owner       = "Prashant"
    }
    } 
}

mod_acr = {
    acr1 = {
        acr_name             = "acrtodoappdev01"
        location             = "centralindia"
        resource_group_name  = "rg-todoapp-dev"
    } 
}

mod_mssql_server = {
    mssql1 = {
        mssql_server_name    = "mssqldbserverdev"
        location             = "centralindia"
        resource_group_name  = "rg-todoapp-dev"
        administrator_login_username       = "sqladminuser"
        administrator_login_password       = "Test@12345"
        tags                 = {
      Environment = "Development"
      Owner       = "Prashant"
    }
    } 
}
mod_mssql_db = {
    db1 = {
        mssql_server_name    = "mssqldbserverdev"
        mssql_db_name        = "sqldbdev"
        sku_name             = "S0"
        tags                 = {
      Environment = "Development"
      Owner       = "Prashant"
    }
    } 
}   
mod_kv = {
    kv1 = {
        kv_name              = "kvtodoappdev"
        location             = "centralindia"
        resource_group_name  = "rg-todoapp-dev"
        tags                 = {
      Environment = "Development"
      Owner       = "Prashant"
    }
    } 
}
