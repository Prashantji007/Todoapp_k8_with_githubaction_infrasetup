variable "LB" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    virtual_network_name = string  
    subnet_name = string
  }))
}