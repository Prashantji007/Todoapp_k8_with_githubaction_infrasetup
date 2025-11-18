variable "vms" {
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    network_interface_ids = list(string)
    size = string
    admin_username = string
   SSH_Key = string
  }))
}

