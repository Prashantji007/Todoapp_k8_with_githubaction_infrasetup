variable "mod_aks" {
  type = map(object({
    aks_name            = string
    location            = string
    resource_group_name = string
    tags                = map(string)
    uai_name            = string
  }))
}
variable "mod_vm" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    network_interface_ids = list(string)
    admin_username      = string
    SSH_Key             = string
  }))
}
variable "mod_bastion_host" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    virtual_network_name = string
    subnet_name          = string
    pip_name             = string
  }))
}
