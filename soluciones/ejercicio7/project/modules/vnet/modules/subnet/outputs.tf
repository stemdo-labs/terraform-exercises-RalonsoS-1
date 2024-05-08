output "subnet_ids" {
  value = [azurerm_subnet.mis_subnets.*.id]
}