terraform {
  cloud {
    organization = "Cofinity-X"

    workspaces {
      name = "tfc-cofinity-x-cloud-infra-dev"
    }
  }
}

provider "azurerm" {
  alias                       = "default"
  subscription_id             = var.provider_azure_subscription_id
  features {}
}

provider "azurerm" {
  alias                       = "speedboat"
  subscription_id             = var.provider_azure_dns_subscription_id
  features {}
}
