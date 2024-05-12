output "nic_ids" {
  value = azurerm_network_interface.nic[*].id
}

output "nic" {
  value = azurerm_network_interface.nic
}