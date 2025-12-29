mod_rgs = {
  rg1 = {
    rg_name  = "rg-todoapp-dev"
    location = "centralindia"
    tags = {
      Environment = "Development"
      Owner       = "Prashant"
    }
}
}

mod_aks = {
  aks1 = {
    aks_name            = "aks-todoapp-dev01"
    location            = "centralindia"
    resource_group_name = "rg-todoapp-dev"
    tags = {
      Environment = "Development"
      Owner       = "Prashant"
    }
    uai_name = "aks-uai-dev"
  }

}

mod_acr = {
  acr1 = {
    acr_name            = "acrtodoappdev01"
    location            = "centralindia"
    resource_group_name = "rg-todoapp-dev"
  }
}

# mod_mssql_server = {
#   mssql1 = {
#     mssql_server_name            = "mssqldbserverdev"
#     location                     = "centralindia"
#     resource_group_name          = "rg-todoapp-dev"
#     administrator_login_username = "sqladminuser"
#     administrator_login_password = "Test@12345"
#     tags = {
#       Environment = "Development"
#       Owner       = "Prashant"
#     }
#   }
# }
# mod_mssql_db = {
#   db1 = {
#     mssql_server_name = "mssqldbserverdev"
#     mssql_db_name     = "sqldbdev"
#     sku_name          = "S0"
#     tags = {
#       Environment = "Development"
#       Owner       = "Prashant"
#     }
#   }
# }
# mod_kv = {
#   kv1 = {
#     kv_name             = "kvtodoappdev"
#     location            = "centralindia"
#     resource_group_name = "rg-todoapp-dev"
#     tags = {
#       Environment = "Development"
#       Owner       = "Prashant"
#     }
#     uai_name = "aks-uai-dev"
#   }
# }

# mod_networking = {
#   "networking1" = {
#     name                = "vnet1"
#     location            = "centralindia"
#     resource_group_name = "rg-todoapp-dev"
#     address_space       = ["10.0.0.0/16"]
#     subnet_name         = "snet1"
#     address_prefixes    = ["10.0.0.0/24"]
#   }

#   "networking2" = {
#     name                = "vnet1"
#     location            = "centralindia"
#     resource_group_name = "rg-todoapp-dev"
#     address_space       = ["10.0.0.0/16"]
#     subnet_name         = "AzureBastionHostSubnet"
#     address_prefixes    = ["10.0.1.0/24"]
#   }
# }


# mod_vm = {
#   "vm1" = {
#     name                = "vm1"
#     location            = "centralindia"
#     resource_group_name = "rg-todoapp-dev"
#     size                = "Standard_b1s"
#     admin_username      = "babu"
#     SSH_Key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDhDMMxtUteVHIEvD0NORazMt7bxBqOFvuOBscyhQpts7fs0dJq6f35OpZRADvmurMphz4ScPKpuI6r2LIYC6ATRQysJSwTYJrM0qPcNAj8KXaUw7gKr5MO5oDEj8INy/hNXrw0Q9Le4RBAG8yyW9G/gjqf0yEp+VVbY5Y7J/vEqM9Be/SByzay+SmMT55dFLV0S5kreSKGKyEgu6z4m4PRTzLMUL2Fa97O5GCsuv/xH8RgcuOGYAQTaD/F7EZbEjBkcdy8ZRLU48Lvv/qd90RQYmGTs4bLGuePuKITmc2S0ykM715Ks7GqK2RGGtdX1MK+Jq7DdrMPkuWSF/cp1LZ3jgj6M2MH43RN7xQfyH3EHBGL2zAH/YE40kPUHdyORlqa0+YWkihnK5NOilKLU19UeUhEW4mFbUFzk2Wfxxnb9Xfr6d2sVuQ8kgDJ2i2qRky4DTOSMjINeR/bo2GSFuMcKtKUNw/67C1L1HiU8vevdFknIONkpHAyAhb3GRHEtIk= prash@LAPTOP-JRP8A76I"
#     network_interface_ids = [""]
#   }
# }

# mod_nic = {
#   "vm1" = {
#     name                 = "nic1"
#     location             = "centralindia"
#     resource_group_name  = "rg-todoapp-dev"
#     ip_name              = "Dynamic_private_IP"
#     virtual_network_name = "vnet1"
#     subnet_name          = "snet1"    
#   }
# }

# mod_asg = {
#   "asg" = {
#     asg                 = "asg1"
#     location            = "centralindia"
#     resource_group_name = "rg-todoapp-dev"
#   }
# }

# mod_nsg = {
#   "nsg" = {
#     nsg                 = "Rule1"
#     location            = "centralindia"
#     resource_group_name = "rg-todoapp-dev"
#     subnet_name          = "snet1"
#     virtual_network_name = "vnet1"
#   }
# }

# mod_bastion_host = {
#   "bh1" = {
#     name                 = "bastion_host1"
#     location             = "centralindia"
#     resource_group_name  = "rg-todoapp-dev"
#     virtual_network_name = "vnet1"
#     subnet_name          = "AzureBastionHostSubnet"
#     pip_name             = "pip_bastionhost"
#   }
# }

# mod_stg = {
#   "stg1" = {
#     name = "storg167"
#     location             = "centralindia"
#     resource_group_name  = "rg-todoapp-dev"
#   }
# }

# mod_logs = {
#   "log" = {
#     name = "logcheck"
#     location             = "centralindia"
#     resource_group_name  = "rg-todoapp-dev"
#   }
# }

# mod_monitor = {
#   "monitoring" = {
#     name = "monitoring-sol"
#     location             = "centralindia"
#     resource_group_name  = "rg-todoapp-dev"
# }
# }

# mod_mgmt = {
#   "mgmt1" = {
#     display_name = "8c6afa46-ccf3-48b2-80e4-401d4571698d"
#   }
# }

# mod_policy = {
#   "policy1" = {
#   name         = "custom-allowed-locations"
#   policy_type  = "Custom"
#   mode         = "All"
#   display_name = "Allowed locations for resources"
#   description  = "Deny creation of resources outside approved regions."
#   policy_rule  =  <<POLICY
# {
#   "if": {
#     "not": {
#       "field": "location",
#       "in": ["eastus", "centralindia", "westeurope"]
#     }
#   },
#   "then": {
#     "effect": "deny"
#   }
# }
# POLICY

#   name_policy_set         = "org-baseline"
#   display_name_policy_set = "Organization Baseline Policies"
#   description_policy_set  = "Baseline policies: allowed locations + tag enforcement"
#   mgmt_name = "8c6afa46-ccf3-48b2-80e4-401d4571698d"
#   }


#   "policy2" = {
#     name         = "custom-enforce-required-tags"
#   policy_type  = "Custom"
#   mode         = "All"
#   display_name = "Ensure required tags are present"
#    description  = "custom-enforce-required-tags."
#   policy_rule = <<POLICY
# {
#   "if": {
#     "field": "tags.Environment",
#     "equals": null
#   },
#   "then": {
#     "effect": "append",
#     "details": {
#       "field": "tags",
#       "value": {
#         "Environment": "non-prod"
#       }
#     }
#   }
# }
# POLICY

#   name_policy_set         = "org-baseline"
#   display_name_policy_set = "Organization Baseline Policies"
#   description_policy_set  = "Baseline policies: allowed locations + tag enforcement"
#   mgmt_name = "8c6afa46-ccf3-48b2-80e4-401d4571698d"
#   }
# }

# mod_LB = {
#   "LB1" = {
#     name = "LB-App-Gatway"
#     location             = "centralindia"
#     resource_group_name  = "rg-todoapp-dev"
#     virtual_network_name = "vnet1"
#      subnet_name         = "snet1"
#   }

# }

# mod_firepoll = {
#   "LB1" = {
#     name = "firepolicy1"
#     location             = "centralindia"
#     resource_group_name  = "rg-todoapp-dev"
#   }

  
# }

# mod_managed_identity = {
#   "aks_identity" = {
#     name                = "aks-uai-dev"
#     location            = "centralindia"
#     resource_group_name = "rg-todoapp-dev"
#   }
# }

# db_connection_string = "Demo_Cponnection_String"
