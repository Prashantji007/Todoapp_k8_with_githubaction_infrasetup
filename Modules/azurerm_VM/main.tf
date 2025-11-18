

resource "azurerm_linux_virtual_machine" "vm1" {
    for_each = var.vms
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  network_interface_ids = each.value.network_interface_ids
  size = each.value.size
  admin_username = each.value.admin_username
admin_ssh_key {
    username   = each.value.admin_username
    #public_key = file("~/.ssh/id_rsa.pub")
     public_key = each.value.SSH_Key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
