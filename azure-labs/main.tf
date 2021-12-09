data "azurerm_billing_mca_account_scope" "main" {
    billing_account_name = var.azure_billing_account_name
    billing_profile_name = var.azure_billing_profile_name
    invoice_section_name = var.azure_invoice_section_name
}

data "azurerm_management_group" "cloud_eng_labs" {
    name = var.azure_root_management_group
}

# resource "azurerm_subscription" "team" {
#     for_each          = var.all_users
#     subscription_name = each.key
#     billing_scope_id  = data.azurerm_billing_mca_account_scope.main.id
# }

# resource "azurerm_management_group_subscription_association" "team" {
#     for_each            = var.all_users
#     management_group_id = data.azurerm_management_group.cloud_eng_labs.id
#     subscription_id     = azurerm_subscription.team[each.key].id
# }