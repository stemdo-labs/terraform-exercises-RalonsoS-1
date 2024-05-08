output "network_security_group_id" {
  description = "Id de nsg"
  value = azurerm_network_security_group.mi_security_group.id
}