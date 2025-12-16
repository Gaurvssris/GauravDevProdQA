terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
}

provider "azurerm" {
    features{}
    subscription_id = "b4461466-1e6b-4be2-bb70-1e96a72a41c8"
  # Configuration options
}