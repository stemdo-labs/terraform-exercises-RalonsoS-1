variable "resource_group_name" {
  type = string
  description = "Name of thee resource group."
}

variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "virtual_machine_name" {
  type        = string
  default     = "vm-semanal"
  description = "Name of the Virtual Machine."
}

variable "virtual_machine_size" {
  type        = string
  default     = "Standard_F2"
  description = "Size or SKU of the Virtual Machine."
}

variable "virtual_machine_admin_username" {
  type        = string
  default     = "adminuser"
  description = "VM admin username."
}

variable "virtual_machine_network_interface_ids" {
  type = list(string)
  description = "Nic id for the vm to link it to existing subnet"
}

variable "disk_name" {
  type        = string
  default     = "vm-disk-semanal"
  description = "Name of the OS disk of the Virtual Machine."
}

variable "redundancy_type" {
  type        = string
  default     = "Standard_LRS"
  description = "Storage redundancy type of the OS disk."
}