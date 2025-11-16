data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

data "azuread_service_principal" "self" {
  object_id = data.azurerm_client_config.current.object_id
}
#
# data azuread_user self {
#   user_principal_name = "leif.eriksen.au_gmail.com#EXT#@leiferiksenaugmail806.onmicrosoft.com"
# }