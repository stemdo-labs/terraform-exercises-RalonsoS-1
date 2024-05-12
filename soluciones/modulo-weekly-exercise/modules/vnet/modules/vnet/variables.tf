variable "resource_group_name" {
  type = string
  description = "Name of thee resource group."
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the Virtual Network."
}

variable "vnet_address_space" {
  type        = list(string)
  default = ["10.0.0.0/16"]
  description = "Vnet address space."  
}