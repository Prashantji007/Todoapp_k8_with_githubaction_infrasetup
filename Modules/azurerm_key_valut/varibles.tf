variable "kv" {
  description = "values for key vault"
    type = map(object({
        kv_name              = string
        location             = string
        resource_group_name  = string
        tags                 = map(string)
    }))
}