variable "resource_name" {
  type    = string
  default = "test"

}
variable "location" {
  type    = string
  default = "eastus"

}
variable "virtual_network_name" {
  type    = string
  default = "mynetwork"

}
variable "cidr_range" {
  type    = string
  default = "10.100.0.0/16"

}
variable "subnet_names" {
  type    = list(string)
  default = ["web", "app", "db"]

}
