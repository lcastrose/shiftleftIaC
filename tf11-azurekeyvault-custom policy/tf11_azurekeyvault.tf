provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}
data "azurerm_client_config" "current" {
}
resource "azurerm_resource_group" "example" {
  name     = "resourceGroup1"
  location = "West US"
}
resource "azurerm_key_vault" "example" {
  name                        = "testvault"
  location                    = "azurerm_resource_group.example.location"
  resource_group_name         = "def"
  enabled_for_disk_encryption = true
  tenant_id                   = "2111-3333-4445-555"
  soft_delete_enabled         = true
  purge_protection_enabled    = false
  sku_name = "standard"
  access_policy {
    tenant_id = "2111-3333-4445-555"
    object_id = "11111111-2222-3333-4444-555555555555"
    key_permissions = [
      "list",
    ]
    secret_permissions = [
      "list",
    ]
    storage_permissions = [
      "get",
    ]
  }
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }
  tags = {
    environment = "Testing"
  }
}