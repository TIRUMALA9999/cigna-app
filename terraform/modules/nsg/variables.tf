variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "allow_internet_web" {
  type    = bool
  default = false
}
