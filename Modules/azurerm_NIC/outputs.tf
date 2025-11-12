output "network_interface_ids" {
  description = "Fetch the NIC id for VM"
  value = {
    for k, v in azurerm_network_interface.nic : k => v.id
  }
}