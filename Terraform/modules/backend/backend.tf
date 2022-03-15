locals {
  rg_name = var.resource_group
  my_loc = var.location
}

# Create a resource group
resource "azurerm_resource_group" "my_rg" {
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