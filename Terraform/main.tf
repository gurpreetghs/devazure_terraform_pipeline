provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "gurpreet_rg" {
  name     = var.gurpreet_rg #gurpreet
  location = "central india"
}

module "backend" {
  source  = "./modules/backend/"
  gurpreet_rg =var.gurpreet_rg
  rg_name = azurerm_resource_group.gurpreet_rg.name
  my_loc  = azurerm_resource_group.gurpreet_rg.location

}
module "demo" {
  source  = "./modules/frontend/"
  gurpreet_rg   = var.gurpreet_rg
  rg_name = azurerm_resource_group.gurpreet_rg.name
  my_loc  = azurerm_resource_group.gurpreet_rg.location
}
