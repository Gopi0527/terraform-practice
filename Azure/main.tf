
resource "azurerm_resource_group" "first" {
  name     = var.resource_name
  location = var.location

}
resource "azurerm_virtual_network" "ng" {
  name                = format("%s-primary", var.resource_name)
  resource_group_name = var.resource_name
  address_space       = [var.cidr_range]
  location            = var.location
  depends_on          = [azurerm_resource_group.first]

}
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = var.resource_name
  virtual_network_name = azurerm_virtual_network.ng.name
  address_prefixes     = [cidrsubnet(var.cidr_range, 8, count.index)]
  depends_on           = [azurerm_virtual_network.ng]

}

