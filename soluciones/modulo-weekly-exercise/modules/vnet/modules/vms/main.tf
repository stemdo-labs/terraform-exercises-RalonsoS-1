terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.102.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = { for idx, vm in var.virtual_machines : idx => vm }

  name                = each.value.name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = each.value.size
  admin_username      = each.value.admin_username
  network_interface_ids = [var.virtual_machine_network_interface_ids[each.key]]

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    name = each.value.disk_name
    caching              = "ReadWrite"
    storage_account_type = each.value.redundancy_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_virtual_machine_extension" "my_vm_extension" {
  for_each = azurerm_linux_virtual_machine.vm
  name                 = "Nginx"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm[each.key].id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
 {
  "commandToExecute": "sudo apt-get update && sudo apt-get install nginx -y && echo \"Hello World from $(hostname)\" > /var/www/html/index.html && sudo systemctl restart nginx"
 }
SETTINGS

}