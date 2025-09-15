variable "mssql_server" {
    description = "A map of mssql servers to create"
    type = map(object({
        mssql_server_name          = string
        resource_group_name       = string
        location                  = string
        administrator_login_username = string
        tags                      = map(string)
    }))
}

variable "mssql_admin_password" {
  description = "Administrator password for MSSQL servers"
  type        = string
  sensitive   = true
}
