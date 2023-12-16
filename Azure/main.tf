
resource "azurerm_resource_group" "first" {
  name     = "test"
  location = "eastus"

}
resource "azurerm_virtual_network" "ng" {
  name                = "ntier"
  resource_group_name = "test"
  address_space       = ["10.100.0.0/16"]
  location            = "eastus"
  depends_on = [ azurerm_resource_group.first ]

}
resource "azurerm_subnet" "web" {
  name                 = "web"
  resource_group_name  = "test"
  virtual_network_name = "ntier"
  address_prefixes     = ["10.100.0.0/24"]
  depends_on = [ azurerm_virtual_network.ng ]

}

resource "azurerm_subnet" "app" {
  name                 = "app"
  resource_group_name  = "test"
  virtual_network_name = "ntier"
  address_prefixes     = ["10.100.1.0/24"]
  depends_on = [ azurerm_virtual_network.ng ]

}
resource "azurerm_subnet" "data" {
  name                 = "data"
  resource_group_name  = "test"
  virtual_network_name = "ntier"
  address_prefixes     = ["10.100.2.0/24"]
  depends_on = [ azurerm_virtual_network.ng ]

}