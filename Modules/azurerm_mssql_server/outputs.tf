output "mssql_server_ids" {
  description = "The IDs of the created SQL Servers"
  value = {
    for k, v in azurerm_mssql_server.mssql_server_todoapp : k => v.id
  }
}
