variable "load_balancer_id" {
  type = string
}

variable "frontend_ip_configuration_name" {
  type = string
}

variable "lb_backend_pool_id" {
  type = string
}

variable "lb_rules" {
  description = "Lista de reglas del balanceador de carga"
  type = list(object({
    name                           = string
    protocol                       = string
    frontend_port                  = number
    backend_port                   = number
    disable_outbound_snat          = bool
  }))
}

variable "outbound_rules" {
  description = "Lista de reglas de salida"
  type = list(object({
    name                           = string
    protocol                       = string
    frontend_ip_configuration_name = string
    backend_address_pool_id        = string
  }))
}