variable "resource_group_name" {
  type = string
  description = "Name of thee resource group."
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
}

variable public_ip_name {
  type        = string
  default     = "lb-semanal-public-ip"
  description = "Name of the Public IP."
}