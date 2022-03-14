locals {
  env_name = var.my_rg
  rg_name  = var.rg_name
  my_loc   = var.my_loc
}

resource "azurerm_network_security_group" "my_asp" {
  name                = local.env_name
  location            = local.my_loc
  resource_group_name = local.rg_name
}

resource "azurerm_virtual_network" "my_asp" {
  name                = local.env_name
  location            = local.my_loc
  resource_group_name = local.rg_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "sbnt"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.my_asp.id
  }

  tags = {
    environment = "Production"
  }
}
resource "azurerm_app_service_plan" "my_asp" {
  name                = local.env_name
  resource_group_name = local.rg_name
  location            = local.my_loc
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_storage_account" "my_asp" {
  name                     = local.env_name
  resource_group_name      = local.rg_name
  location                 = local.my_loc
  account_tier             = "Standard"
  account_replication_type = "LRS"
}