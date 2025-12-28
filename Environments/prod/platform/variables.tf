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
    uai_name            = string
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

variable "mod_LB" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    virtual_network_name = string  
    subnet_name = string
  }))
}


variable "db_connection_string" {
  type = any
  sensitive = true
}
