variable "mod_rgs" {
  type = map(object({
    rg_name  = string
    location = string
    tags     = map(string)
  }))
}

variable "mod_mgmt" {
  type = map(object({
    display_name = string
  }))
}

variable "mod_policy" {
  type = map(object({
    name                    = string
    policy_type             = string
    mode                    = string
    display_name            = string
    description             = string
    policy_rule             = string
    name_policy_set         = string
    display_name_policy_set = string
    description_policy_set  = string
    mgmt_name               = string
  }))
}

variable "mod_managed_identity" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}
