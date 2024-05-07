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