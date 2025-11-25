terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
    
  }
   
  # backend "azurerm" {
  #   resource_group_name  = "Test"
  #   storage_account_name = "todoterraformstate"
  #   container_name       = "tfstate"
  #   key                  = "infra/terraform.tfstate"
  # }
 required_version = ">=1.0"
}


provider "azurerm" {
  features {

  }
  subscription_id = "e8adc8a2-d308-4d54-a68d-45a79457a55f"
}

