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

variable "vnet_address_space" {
  type = list(string)
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "owner_tag" {
  type        = string
  nullable    = false
  description = "Describe el propietario de la VNet."
  validation {
    condition     = length(var.owner_tag) > 0
    error_message = "El valor no puede ser una cadena vacia."
  }
}

variable "environment_tag" {
  type        = string
  nullable    = false
  description = "Describe el entorno de la VNet (dev, test, prod, etc)."
  validation {
    condition     = length(var.environment_tag) > 0
    error_message = "El valor no puede ser una cadena vacia."
  }

  validation {
    condition = contains(["DEV", "PRO", "TES", "PRE"], upper(var.environment_tag))
    error_message = "El valor debe ser dev, pro, pre o test."
  }
}

variable "vnet_tags" {
  description = "Tags adicionales para la VNet."
  type        = map(string)
  default     = {}
  nullable = false
  validation {
    condition = length(var.vnet_tags) > 0  && length([for value in values(var.vnet_tags) : value if coalesce(value, "is-null") == "is-null"]) == 0
    error_message = "No puede ser nulo."
  }
}
