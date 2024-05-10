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
  count = 2
  name                = "${var.virtual_machine_name}${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = var.virtual_machine_size
  admin_username      = var.virtual_machine_admin_username
  network_interface_ids = [
    var.virtual_machine_network_interface_ids[count.index]
  ]

  admin_ssh_key {
    username   = var.virtual_machine_admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    name = "${var.disk_name}${count.index}"
    caching              = "ReadWrite"
    storage_account_type = var.redundancy_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_virtual_machine_extension" "my_vm_extension" {
  count                = 2
  name                 = "Nginx"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm[count.index].id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
 {
  "commandToExecute": "sudo apt-get update && sudo apt-get install nginx -y && echo \"Hello World from $(hostname)\" > /var/www/html/index.html && sudo systemctl restart nginx"
 }
SETTINGS

}