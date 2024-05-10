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

variable "lb_public_ip_id" {
  type = string
}

variable "load_balancer_name" {
  type        = string
  default     = "lb-semanal"
  description = "Name of the Load Balancer."
}

variable "vms_nic_ids" {
  type = list(string)
}