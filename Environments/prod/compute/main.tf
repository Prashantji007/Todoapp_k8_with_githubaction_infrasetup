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



module "aks" {
  depends_on = [module.rg, module.mod_manged_identity,module.LB]
  source     = "../../../Modules/azurerm_AKS"
  aks        = var.mod_aks
}


module "vm" {
  depends_on = [module.rg, module.netwokring, module.nic]
  source     = "../../../Modules/azurerm_VM"
  vms = {
    for k, v in var.mod_vm :
    k => merge(v, {
      network_interface_ids = [module.nic.network_interface_ids[k]]
  }) }
}

module "bastion_host" {
  depends_on   = [module.rg, module.netwokring, module.vm]
  source       = "../../../Modules/azurerm_Bastion_Host"
  bastion_host = var.mod_bastion_host
}