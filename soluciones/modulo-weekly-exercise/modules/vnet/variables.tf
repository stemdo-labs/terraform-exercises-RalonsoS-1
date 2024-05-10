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

variable "subnet_name" {
  type        = string
  default     = "test-subnet"
  description = "Name of the subnet."
}

variable public_ip_name {
  type        = string
  default     = "lb-semanal-public-ip"
  description = "Name of the Public IP."
}

variable "network_interface_name" {
  type        = string
  description = "Name of the Network Interface."  
}