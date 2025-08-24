resource "azurerm_mssql_database" "mssql_server_db_todoapp" {
    for_each    = var.mssql_db
  name         = each.value.mssql_db_name
  server_id    = each.value.server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = each.value.tags                   
}