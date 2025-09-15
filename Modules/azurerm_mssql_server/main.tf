resource "azurerm_mssql_server" "mssql_server_todoapp" {
    for_each = var.mssql_server
  name                         = each.value.mssql_server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.administrator_login_username
  administrator_login_password = var.mssql_admin_password
  minimum_tls_version          = "1.2"
    tags                         = each.value.tags
}
