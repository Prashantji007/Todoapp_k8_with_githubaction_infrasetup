variable "mod_rgs" {
  type = map(object({
    rg_name  = string
    location = string
    tags     = map(string)
  }))
}
variable "mod_aks" {
  type = map(object({
    aks_name            = string
    location            = string
    resource_group_name = string
    tags                = map(string)
  }))
}
variable "mod_acr" {
  type = map(object({
    acr_name            = string
    location            = string
    resource_group_name = string
  }))
}
variable "mod_mssql_server" {
  type = map(object({
    mssql_server_name            = string
    resource_group_name          = string
    location                     = string
    administrator_login_username = string
    administrator_login_password = string
    tags                         = map(string)
  }))

}
variable "mod_mssql_db" {
  type = map(object({
    mssql_db_name = string
    tags          = map(string)
  }))
}

variable "mod_kv" {
  type = map(object({
    kv_name             = string
    location            = string
    resource_group_name = string
    tags                = map(string)
  }))
}

variable "mod_networking" {
   type = map(object({
    name = string
    location = string
    resource_group_name = string
    address_space = list(string)
    subnet_name = string
    address_prefixes = list(string)
    nsg = string 
    asg = string
  }))
}

variable "mod_vm" {
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    size = string
    admin_username = string
  }))
}

variable "mod_nic" {
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    ip_name = string
    subnet_name = string
    virtual_network_name = string
   }))
}