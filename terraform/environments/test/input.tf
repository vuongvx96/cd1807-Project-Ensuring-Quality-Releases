# Azure GUIDS
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

# Resource Group/Location
variable "location" {}
variable "resource_group" {}
variable "application_type" {}

# Network
variable virtual_network_name {}
variable address_prefix_test {}
variable address_space {}

# VM
variable "admin_username" {
  default = "realadmin"
}
variable "admin_password" {
  default = "123456"
}
variable "vm_size" {
  default = "Standard_DS2_v2"
  # "Standard_B1s",
  # "Standard_B2s",
  # "Standard_DS1_v2",
  # "Standard_DS2_v2",
  # "Standard_D2s_v3",
  # "Standard_B2ms"
}
