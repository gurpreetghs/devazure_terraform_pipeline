locals {
  env_name = var.my_rg
  rg_name = var.rg_name
  my_loc   = var.my_loc
}

resource "azurerm_app_service_plan" "my_asp" {
  name = local.env_name
  resource_group_name = local.rg_name
  location = local.my_loc
  sku {
      tier = "Standard"
      size = "S1"
  }
}