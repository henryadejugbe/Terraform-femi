 terraform {
  required_version = ">= 0.11" 
 backend "azurerm" {
  storage_account_name = "__terraformstorageaccount__"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
	access_key  ="__storagekey__"
	}
	}
  provider "azurerm" {
  features {}
}
resource "azurerm_resource_group"{
  name     = "PULTerraform"
  location = "West Europe"
}

resource "azurerm_app_service_plan"{
  name                = "__appserviceplan__"
  location            = "${azurerm_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.name}"

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service"{
  name                = "__appservicename__"
  location            = "${azurerm_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.name}"
  app_service_plan_id = "${azurerm_app_service_plan.id}"

}