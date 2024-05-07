variable "existent_resource_group_name" {
    type = string
}

variable "vnet_name" {
    type = string
}

variable "vnet_address_space" {
    type = list(string)
}

variable "location" {
    type = string
    default = "West Europe"
}

variable "owner_tag" {
  type = string
  description = "Describe el propietario de la VNet."
  nullable = false
}

variable "environment_tag" {
  type = string
  description = "Describe el entorno de la VNet (dev, test, prod, etc)."
  nullable = false
}

variable "vnet_tags" {
  description = "Tags adicionales para la VNet."
  type        = map(string)
  default     = {}
}