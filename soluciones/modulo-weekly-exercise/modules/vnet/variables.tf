variable "resource_group" {
  description = "Details of the resource group."
  type = object({
    name     = string
    location = string
  })
  default = {
    name     = "default_resource_group_name"
    location = "westeurope"
  }
}

variable "virtual_network" {
  description = "Details of the Virtual Network."
  type = object({
    name           = string
    address_space  = list(string)
  })
  default = {
    name           = "weekly-vnet"
    address_space  = ["10.0.0.0/16"]
  }
}

variable "subnet" {
  description = "Details of the subnet."
  type = object({
    name              = string
    address_prefixes  = list(string)
  })
  default = {
    name              = "test-subnet"
    address_prefixes  = ["10.0.1.0/24"]
  }
}

variable "network_security_group" {
  description = "Details of the Network Security Group."
  type = object({
    nsg_name       = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  })
  default = {
    nsg_name       = "default_nsg_name"
    security_rules = [
      {
        name                       = "web"
        priority                   = 1008
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}


variable public_ip_name {
  type        = string
  default     = "lb-semanal-public-ip"
  description = "Name of the Public IP."
}

variable "network_interface_name" {
  type        = string
  default     = "weekly-nic"
  description = "Name of the Network Interface."  
}

variable "vms" {
  description = "List of virtual machines to create"
  type = list(object({
    name                = string
    size                = string
    admin_username      = string
    disk_name           = string
    redundancy_type     = string
  }))
  default = [
    {
      name = "vm1"
      size = "Standard_F2"
      admin_username = "adminuser"
      disk_name = "vm-1-disk_semanal"
      redundancy_type = "Standard_LRS"
    },
    {
      name = "vm2"
      size = "Standard_F2"
      admin_username = "adminuser"
      disk_name = "vm-2-disk_semanal"
      redundancy_type = "Standard_LRS"
    }
  ]
}