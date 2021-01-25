data "azurerm_client_config" "current" {}

resource "azurerm_data_factory" "df" {
  name                = "${var.datafactory_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  identity {
    type = "SystemAssigned"
  }
}

output "data_factory_sp_id" {
  value = azurerm_data_factory.df.identity[0].principal_id
}

output "data_factory_id" {
  value = azurerm_data_factory.df.id
}





