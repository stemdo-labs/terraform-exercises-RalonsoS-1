variable "existent_resource_group_name" {
  type = string
}

variable "subnets" {
  description = "List of subnets to create"
  type        = list(string)
}

variable "location" {
  type    = string
  default = "West Europe"
}

