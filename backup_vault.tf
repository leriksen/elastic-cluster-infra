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