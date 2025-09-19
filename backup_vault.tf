resource azurerm_data_protection_backup_vault vault {
  location            = azurerm_resource_group.rg.location
  name                = local.vault_name
  resource_group_name = azurerm_resource_group.rg.name
  datastore_type      = module.global.bv_datastore_type
  redundancy          = module.global.bv_redundancy
  identity {
    type = "SystemAssigned"
  }
  immutability = module.global.bv_immutability
  soft_delete  = module.global.bv_soft_delete
}

resource "azurerm_data_protection_backup_vault_customer_managed_key" "cmk" {
  depends_on = [
    azurerm_role_assignment.cmk_vault
  ]
  data_protection_backup_vault_id = azurerm_data_protection_backup_vault.vault.id
  key_vault_key_id                = azurerm_key_vault_key.cmk.versionless_id
}
