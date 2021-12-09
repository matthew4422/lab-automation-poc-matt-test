module "azuread" {
  source = "./azuread/"

  azuread_group       = var.azuread_group
  azuread_admin_group = var.azuread_admin_group
}

module "gcp-labs" {
  source  = "./gcp-labs/"

  enabled_users          = module.azuread.enabled_users
  all_users              = module.azuread.all_users
  admin_users            = module.azuread.admin_users
  gcp_parent_folder      = var.gcp_parent_folder
  gcp_org                = var.gcp_org
  gcp_billing_account_id = var.gcp_billing_account_id
}

module "azure-labs" {
  source  = "./azure-labs/"

  enabled_users               = module.azuread.enabled_users
  all_users                   = module.azuread.all_users
  admin_users                 = module.azuread.admin_users
  azure_billing_account_name  = var.azure_billing_account_name
  azure_invoice_section_name  = var.azure_invoice_section_name
  azure_billing_profile_name  = var.azure_billing_profile_name
  azure_root_management_group = var.azure_root_management_group
}

output "enabled_users" {
  value = module.azuread.enabled_users
}

output "all_users" {
  value = module.azuread.all_users
}

output "admin_users" {
  value = module.azuread.admin_users
}

output "billing_scope" {
  value = module.azure-labs.billing_scope
}