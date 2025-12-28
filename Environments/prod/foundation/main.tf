module "rg" {
  source = "../../../Modules/azurerm_rg"
  rgs    = var.mod_rgs
}


module "mod_manged_identity" {
  depends_on       = [module.rg]
  source           = "../../../Modules/azurerm_managed_identity"
  managed_identity = var.mod_managed_identity
}

module "mgmt" {
  depends_on = [module.rg]
  source     = "../../../Modules/azurerm_mgmt_group"
  mgmt       = var.mod_mgmt
}

module "policy" {
  depends_on = [module.mgmt]
  source     = "../../../Modules/azurerm_policy_mgmt"
  policy     = var.mod_policy
}
