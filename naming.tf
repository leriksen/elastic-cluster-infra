locals {
  umi_name   = format("%s-umi", azurerm_resource_group.rg.name)
  vault_name = format("%s-vault", azurerm_resource_group.rg.name)
}