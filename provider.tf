terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.25.0"
    }
  }
}

provider "azurerm" {
    subscription_id = ""
    client_id = ""                  
    tenant_id = ""
    client_secret =  ""
  features {
    
  }
}
