variable "kv" {
  description = "values for key vault"
    type = map(object({
        kv_name              = string
        location             = string
        resource_group_name  = string
        tags                 = map(string)
        uai_name             = string 
    }))
}

variable "db_connection_string" {
  type = string
  sensitive = true
}
