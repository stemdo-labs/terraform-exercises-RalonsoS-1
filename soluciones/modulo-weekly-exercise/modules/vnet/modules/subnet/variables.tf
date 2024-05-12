variable "resource_group_name" {
  type = string
  description = "Name of thee resource group."
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

variable subnet_address_prefixes {
  type        = list(string)
  default     = ["10.0.1.0/24"]
}