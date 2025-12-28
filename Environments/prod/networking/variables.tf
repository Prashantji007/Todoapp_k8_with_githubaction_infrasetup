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


variable "mod_firepoll" {
  type = map(object({
    name = string
    location = string
    resource_group_name =  string
  }))
}
