resource "azurerm_network_interface" "nic" {
  count               = var.vms_quantity
  name                = "${var.network_interface_name}${count.index}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig${count.index}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}