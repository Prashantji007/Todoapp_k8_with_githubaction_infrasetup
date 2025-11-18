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
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnet_name         = string
    address_prefixes    = list(string)
  }))
}

variable "mod_vm" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    admin_username      = string
    SSH_Key = string
  }))
}

variable "mod_nic" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    ip_name              = string
    subnet_name          = string
    virtual_network_name = string
  }))
}

variable "mod_nsg" {
  type = map(object({
    nsg                 = string
    location            = string
    resource_group_name = string
    subnet_name = string
    virtual_network_name = string
  }))
}

variable "mod_asg" {
  type = map(object({
    asg                 = string
    location            = string
    resource_group_name = string
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

variable "mod_stg" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "mod_logs" {
  type = map(object({
    name = string
    location = string
    resource_group_name = string
  }))
}

variable "mod_monitor" {
   type = map(object({
    name = string
    resource_group_name = string
    location = string 
  }))
}

variable "mod_mgmt" {
  type = map(object({
    display_name = string
  }))
}

variable "mod_policy" {
   type = map(object({
    name = string
    policy_type =  string
    mode = string
    display_name =string
    description = string
    policy_rule =  string
    name_policy_set = string
    display_name_policy_set =string
    description_policy_set = string
    mgmt_name = string
  }))
}

variable "mod_LB" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    virtual_network_name = string  
  }))
}
