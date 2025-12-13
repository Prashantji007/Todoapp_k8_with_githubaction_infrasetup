data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "key_vault_todoapp" {
    for_each = var.kv
  name                        = each.value.kv_name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enable_rbac_authorization = true
  public_network_access_enabled = false
  sku_name = "standard"

  # access_policy {
  #   tenant_id = data.azurerm_client_config.current.tenant_id
  #   object_id = data.azurerm_client_config.current.object_id

  #   key_permissions = [
  #     "Get",
  #   ]

  #   secret_permissions = [
  #     "Get",
  #   ]

  #   storage_permissions = [
  #     "Get",
  #   ]
  # }
  tags = each.value.tags
}


data "azurerm_user_assigned_identity" "uai" {
  for_each = var.kv
  name                =each.value.uai_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_role_assignment" "aks_kv_reader" {
  for_each = var.kv
  scope                = azurerm_key_vault.key_vault_todoapp[each.key].id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = data.azurerm_user_assigned_identity.uai[each.key].principal_id
}

# Example secret: DB Connection String
resource "azurerm_key_vault_secret" "db_conn" {
  for_each = var.kv
  name         = "db-connection"
  value        = var.db_connection_string
  key_vault_id = azurerm_key_vault.key_vault_todoapp[each.key].id
}