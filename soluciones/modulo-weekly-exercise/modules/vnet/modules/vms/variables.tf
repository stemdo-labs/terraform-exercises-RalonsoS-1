variable "virtual_machine_network_interface_ids" {
  type = list(string)
  description = "Nic id for the vm to link it to existing subnet"
}

variable "resource_group_name" {
  type = string
  description = "Name of thee resource group."
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
}

variable "virtual_machines" {
  description = "List of virtual machines to create"
  type = list(object({
    name                = string
    size                = string
    admin_username      = string
    disk_name           = string
    redundancy_type     = string
  }))
  default = [
    {
      name = "vm1"
      size = "Standard_F2"
      admin_username = "adminuser"
      disk_name = "vm-1-disk_semanal"
      redundancy_type = "Standard_LRS"
    },
    {
      name = "vm2"
      size = "Standard_F2"
      admin_username = "adminuser"
      disk_name = "vm-2-disk_semanal"
      redundancy_type = "Standard_LRS"
    }
  ]
}