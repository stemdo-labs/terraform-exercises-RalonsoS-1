output "vms_nic_ids" {
  value = [azurerm_linux_virtual_machine.vm[*].network_interface_ids]
}