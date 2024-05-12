variable "resource_group_name" {
  type = string
  description = "Name of thee resource group."
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
}

variable "subnet_id" {
  type        = string
  description = "Id of the subnet."
}

variable "vms_quantity" {
  type = number
  description = "Number of virtual machines that will be created"
}

variable "network_interface_name" {
  type        = string
  description = "Name of the Network Interface."  
}