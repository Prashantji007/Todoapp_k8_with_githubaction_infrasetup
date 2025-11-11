


module "rg" {
  source = "../../Modules/azurerm_rg"
  rgs    = var.mod_rgs
}

module "aks" {
  depends_on = [module.rg]
  source     = "../../Modules/azurerm_AKS"
  aks        = var.mod_aks
}

module "acr" {
  depends_on = [module.rg]
  source     = "../../Modules/azurerm_ACR"
  acr        = var.mod_acr
}

module "mssql_server" {
    depends_on = [ module.rg ]
    source = "../../Modules/azurerm_mssql_server"
    mssql_server  = var.mod_mssql_server
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

module "netwokring" {
  depends_on = [ module.rg ]
  source = "../../Modules/netwroking"
  vnet = var.mod_networking
}

module "nsg" {
  depends_on = [ module.rg,module.netwokring ]
  source = "../../Modules/NSG"
  nsg = var.mod_nsg
  
}

module "asg" {
  depends_on = [ module.rg,module.netwokring ]
  source = "../../Modules/ASG"
  asg = var.mod_asg
  
}
module "nic" {
  depends_on = [ module.netwokring ]
  source = "../../Modules/NIC"
  nic = var.mod_nic
}

module "vm" {
  depends_on = [ module.rg, module.netwokring, module.nic ]
  source = "../../Modules/VM"
  vms ={
    for k,v in var.mod_vm:
    k => merge(v,{
      network_interface_ids = [module.nic.network_interface_ids[k]]
    }) }
}


module "bastion_host" {
  depends_on = [ module.rg,module.netwokring,module.vm ]
  source = "../../Modules/Bastion_Host"
  bastion_host = var.mod_bastion_host
}
# module "kv" {
#     depends_on = [ module.rg ]
#     source = "../../Modules/azurerm_key_valut"
#     kv  = var.mod_kv   

# }
