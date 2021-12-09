locals {
  enabled_users = {
    for user in data.azuread_user.team :
      lower(replace(regex("[^@]*", user.user_principal_name),".","-")) => {
        name = user.display_name
        email = user.user_principal_name
      }
    if user.account_enabled
  }
  all_users = {
    for user in data.azuread_user.team :
      lower(replace(regex("[^@]*", user.user_principal_name),".","-")) => {
        name = user.display_name
        email = user.user_principal_name
      }
  }
  admin_users = flatten([
    for user in data.azuread_user.team : [
      for admin in data.azuread_user.admins : [ "${lower(replace(regex("[^@]*", user.user_principal_name),".","-"))}__${admin.user_principal_name}__${user.user_principal_name}"]
    ]
  ])
}

variable "azuread_group" {}
variable "azuread_admin_group" {}