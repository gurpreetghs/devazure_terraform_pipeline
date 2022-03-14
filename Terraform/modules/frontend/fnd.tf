locals {
  env_name = var.my_rg
  rg_name  = var.rg_name
  my_loc   = var.my_loc
}

resource "azurerm_function_app" "my_asp" {
  name                       = local.env_name
  location                   = local.my_loc
  resource_group_name        = local.rg_name
  app_service_plan_id        = azurerm_app_service_plan.my_asp.id
  storage_account_name       = azurerm_storage_account.my_asp.name
  storage_account_access_key = azurerm_storage_account.my_asp.primary_access_key
}