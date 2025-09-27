


module "rg" {
    source = "../../Modules/azurerm_rg"
    rgs  = var.mod_rgs
}

module "aks" {
    depends_on = [ module.rg ]
    source = "../../Modules/azurerm_AKS"
    aks  = var.mod_aks
}

module "acr" {
    depends_on = [ module.rg ]
    source = "../../Modules/azurerm_ACR"
    acr  = var.mod_acr  
}

# module "mssql_server" {
#     depends_on = [ module.rg ]
#     source = "../../Modules/azurerm_mssql_server"
#     mssql_server  = var.mod_mssql_server
# }

# module "mssql_db" {
#   depends_on = [module.mssql_server, module.rg]
#   source     = "../../Modules/azurerm_mssql_DB"
#     mssql_db = {
#     for k, v in var.mod_mssql_db :
#     k => merge(v, {
#       server_id = module.mssql_server.mssql_server_ids["mssql1"]
#     })
#   }
# }


# module "kv" {
#     depends_on = [ module.rg ]
#     source = "../../Modules/azurerm_key_valut"
#     kv  = var.mod_kv   
  
# }
