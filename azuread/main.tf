data "azuread_group" "team" {
  display_name     = var.azuread_group
  security_enabled = true
}

data "azuread_user" "team" {
  for_each  = toset(data.azuread_group.team.members)
  object_id = each.key
}

data "azuread_group" "admins" {
  display_name     = var.azuread_admin_group
  security_enabled = true
}

data "azuread_user" "admins" {
  for_each  = toset(data.azuread_group.admins.members)
  object_id = each.key
}
