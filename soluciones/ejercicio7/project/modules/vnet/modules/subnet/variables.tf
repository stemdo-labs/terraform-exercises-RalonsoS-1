variable "subnets" {
  description = "List of subnets to create"
  type        = list(map(string))
}

variable "existent_resource_group_name" {
  type = string
}

variable "vnet_name" {
  type     = string
  nullable = false
  validation {
    condition     = can(regex("^vnet[a-z]{3,}tfexercise\\d{2,}$", var.vnet_name))
    error_message = "El nombre de la vnet no es válido."
  }
}