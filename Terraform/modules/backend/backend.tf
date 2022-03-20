locals {
  env_name = var.gurpreet_rg
  rg_name = var.rg_name
  my_loc = var.my_loc
}

resource "azurerm_storage_account" "preetbackendsac" {
  name                     = "gurpreet"
  resource_group_name      = local.rg_name
  location                 = local.my_loc
  account_tier             = "Standard"
  account_replication_type = "GRS"


} 