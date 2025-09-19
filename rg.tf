resource "azurerm_resource_group" "rg" {
  location = module.global.location
  name     = "psql-fs-ec"
}

resource azurerm_role_assignment reader_role {
  principal_id         = azurerm_data_protection_backup_vault.vault.identity[0].principal_id
  role_definition_name = "Reader"
  scope                = azurerm_resource_group.rg.id
}
