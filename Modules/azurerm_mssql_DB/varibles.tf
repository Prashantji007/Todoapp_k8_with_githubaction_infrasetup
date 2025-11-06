variable "mssql_db" {
    description = "A map of mssql databases to create"
    type = map(object({
        mssql_db_name = string
        tags          = map(string)
    }))
  
}