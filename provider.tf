terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "aks-demo-rg"
    storage_account_name = "newclassicstg"
    container_name       = "jen-con"
    key                  = "terraform.tfstate"
    
  }
}

provider "azurerm" {
  features {}
  subscription_id = "48959946-2f7e-4d0f-8c80-ed7b8706e6c3"
}