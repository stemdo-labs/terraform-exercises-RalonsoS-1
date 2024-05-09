output "ids" {
  value = azurerm_subnet.mis_subnets[*].id
}