output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

output "vnet" {
  value = azurerm_virtual_network.vnet
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "nic_ids" {
  value = azurerm_network_interface.nic[*].id
}

output "lb_public_ip_id" {
  value = azurerm_public_ip.lb_public_ip.id
}

output "lb_public_ip_name" {
  value = azurerm_public_ip.lb_public_ip.name
}

output "lb_public_ip" {
  value = azurerm_public_ip.lb_public_ip
}

output "vms" {
  value = module.vms
}