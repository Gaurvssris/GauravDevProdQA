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
    subscription_id = "84dd7c9c-ad3c-4682-abd1-5403bd6ffa0d"
  # Configuration options
}