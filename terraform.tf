terraform {
  backend "azurerm" {
    resource_group_name   = "demo-resource-group"   # Name of the resource group
    storage_account_name  = "demoterraformsm"   # Name of the storage account
    container_name        = "tfstate"      # Name of the blob container
    key                   = "statetf/terraform.tfstate"  # Blob key (path to the state file)
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
