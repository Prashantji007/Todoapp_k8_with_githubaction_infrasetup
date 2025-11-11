variable "nic" {
   type = map(object({
    name = string
    location = string
    resource_group_name = string
    ip_name = string
    subnet_name = string
    virtual_network_name = string
   }))
}