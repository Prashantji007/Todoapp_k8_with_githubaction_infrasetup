variable "managed_identity" {
  type = map(object({
    name = string
    location = string   
    resource_group_name = string
  }))
}