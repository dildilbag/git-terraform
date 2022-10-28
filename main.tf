

resource "azurerm_resource_group" "dilbag-terraform-rg" {
  name     = "dilbag-terraform-rg"
  location = "West Europe"
}
## storage account create
resource "azurerm_storage_account" "dilstorageaccount" {
  name                     = "dilstorage2"
  location                 = azurerm_resource_group.dilbag-terraform-rg.location
  resource_group_name      = azurerm_resource_group.dilbag-terraform-rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
 
}

## cretae blob storage Account
resource "azurerm_storage_container" "dilblobcontainer" {
  name                  = "dilblobstorage"
  storage_account_name  = azurerm_storage_account.dilstorageaccount.name
  container_access_type = "blob"
  
}
terraform {
    backend "azurerm" {
        resource_group_name = "dilbag-terraform-rg"
        storage_account_name = "dilstorage2"
        container_name       = "dilblobstorage"
        key                  = "terraform.tfstate"
      
    }
}