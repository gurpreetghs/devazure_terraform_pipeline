locals {
  rg_name = var.my_rg
  my_loc = var.my_loc
}

# Create a resource group
resource "azurerm_resource_group" "preet" {
  name     = local.rg_name
  location = local.my_loc
}

resource "azurerm_storage_account" "backend" {
  name                     = "gurpreet"
  resource_group_name      = local.rg_name
  location                 = local.my_loc
  account_tier             = "Standard"
  account_replication_type = "GRS"


} 