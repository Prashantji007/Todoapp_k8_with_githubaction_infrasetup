
data "terraform_remote_state" "foundation" {
  backend = "azurerm"

  config = {
    resource_group_name  = "Test"
    storage_account_name = "todoterraformstate"
    container_name       = "tfstate"
    key                  = "prod/infra/foundation/terraform.tfstate"
  }
  
}

module "netwokring" {
  #depends_on = [module.rg]
  source     = "../../../Modules/azurerm_netwroking"
  vnet       = var.mod_networking
}

module "nsg" {
  depends_on = [ module.netwokring]
  source     = "../../../Modules/azurerm_NSG"
  nsg        = var.mod_nsg

}

module "asg" {
  depends_on = [ module.netwokring]
  source     = "../../../Modules/azurerm_ASG"
  asg        = var.mod_asg

}
module "nic" {
  depends_on = [module.netwokring]
  source     = "../../../Modules/azurerm_NIC"
  nic        = var.mod_nic
}

module "firewall" {
  #depends_on = [ module.rg ]
  source = "../../../Modules/azurerm_Firewall_Policy_Rules"
  firepoll = var.mod_firepoll

}
