
data "terraform_remote_state" "foundation" {
  backend = "azurerm"

  config = {
    resource_group_name  = "Test"
    storage_account_name = "todoterraformstate"
    container_name       = "tfstate"
    key                  = "prod/infra/foundation/terraform.tfstate"
  }
  
}

data "terraform_remote_state" "networking" {
  backend = "azurerm"

  config = {
    resource_group_name  = "Test"
    storage_account_name = "todoterraformstate"
    container_name       = "tfstate"
    key                  = "prod/infra/networking/terraform.tfstate"
  }
  
}

data "terraform_remote_state" "compute" {
  backend = "azurerm"
  config = {
    resource_group_name  = "Test"
    storage_account_name = "todoterraformstate"
    container_name       = "tfstate"
    key                  = "prod/infra/compute/terraform.tfstate"
  }
}

module "acr" {
  depends_on = [module.rg]
  source     = "../../Modules/azurerm_ACR"
  acr        = var.mod_acr
}

module "mssql_server" {
  depends_on   = [module.rg]
  source       = "../../Modules/azurerm_mssql_server"
  mssql_server = var.mod_mssql_server
}

module "mssql_db" {
  depends_on = [module.mssql_server, module.rg]
  source     = "../../Modules/azurerm_mssql_DB"
  mssql_db = {
    for k, v in var.mod_mssql_db :
    k => merge(v, {
      server_id = module.mssql_server.mssql_server_ids["mssql1"]
    })
  }
}

module "kv" {
  depends_on = [module.rg, module.aks, module.mod_manged_identity]
  source     = "../../Modules/azurerm_key_valut"
  kv         = var.mod_kv
  db_connection_string = var.db_connection_string
}

module "stg" {
  depends_on = [module.rg]
  source     = "../../../Modules/azurerm_storage_account"
  stg        = var.mod_stg
}

module "logs" {
  depends_on = [module.rg, module.monitor ]
  source = "../../../Modules/azurerm_log_analytics"
  logs = var.mod_logs
}

module "monitor" {
  depends_on = [ module.rg ]
  source = "../../../Modules/azrerm_azure_monitor"
  monitor = var.mod_monitor
}


module "LB" {
  depends_on = [ module.netwokring, module.firewall ]
  source = "../../../Modules/azurerm_Load_balancer_app_gateway"
  LB = var.mod_LB
  waf_policy_id  = module.firewall.waf_policy_id
 
}