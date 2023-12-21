variable "vpc_cidr" {
  type    = string
  default = "10.100.0.0/16"
}
variable "region" {
  type    = string
  default = "us-east-1"

}
variable "subnetcount" {
  type = string
  default = "3"
  
}
variable "subnet_names" {
  type    = list(string)
  default = ["web","business","data"]
}