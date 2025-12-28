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

mod_vm = {
  "vm1" = {
    name                = "vm1"
    location            = "centralindia"
    resource_group_name = "rg-todoapp-dev"
    size                = "Standard_b1s"
    admin_username      = "babu"
    SSH_Key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDhDMMxtUteVHIEvD0NORazMt7bxBqOFvuOBscyhQpts7fs0dJq6f35OpZRADvmurMphz4ScPKpuI6r2LIYC6ATRQysJSwTYJrM0qPcNAj8KXaUw7gKr5MO5oDEj8INy/hNXrw0Q9Le4RBAG8yyW9G/gjqf0yEp+VVbY5Y7J/vEqM9Be/SByzay+SmMT55dFLV0S5kreSKGKyEgu6z4m4PRTzLMUL2Fa97O5GCsuv/xH8RgcuOGYAQTaD/F7EZbEjBkcdy8ZRLU48Lvv/qd90RQYmGTs4bLGuePuKITmc2S0ykM715Ks7GqK2RGGtdX1MK+Jq7DdrMPkuWSF/cp1LZ3jgj6M2MH43RN7xQfyH3EHBGL2zAH/YE40kPUHdyORlqa0+YWkihnK5NOilKLU19UeUhEW4mFbUFzk2Wfxxnb9Xfr6d2sVuQ8kgDJ2i2qRky4DTOSMjINeR/bo2GSFuMcKtKUNw/67C1L1HiU8vevdFknIONkpHAyAhb3GRHEtIk= prash@LAPTOP-JRP8A76I"
    network_interface_ids = [""]
  }
}

mod_bastion_host = {
  "bh1" = {
    name                 = "bastion_host1"
    location             = "centralindia"
    resource_group_name  = "rg-todoapp-dev"
    virtual_network_name = "vnet1"
    subnet_name          = "AzureBastionHostSubnet"
    pip_name             = "pip_bastionhost"
  }
}