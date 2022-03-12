
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.98.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "my_rg" {
  name     = var.my_rg
  location = "central india"
}

module "frontend" {
  source  = "./modules"
  my_rg   = var.my_rg
  rg_name = azurerm_resource_group.my_rg.name
  my_loc  = azurerm_resource_group.my_rg.location
}