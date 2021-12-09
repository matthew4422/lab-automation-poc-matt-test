
data "google_folder" "parent" {
    folder = "folders/${var.gcp_parent_folder}"
}

resource "google_billing_account_iam_member" "team_member" {
    for_each           = var.enabled_users
    billing_account_id = var.gcp_billing_account_id
    role               = "roles/billing.user"
    member             = "user:${each.value.email}"
}

resource "google_folder_iam_member" "team_folders_creator" {
    for_each = var.enabled_users
    folder   = google_folder.team_folders[each.key].id
    role     = "roles/resourcemanager.folderCreator"
    member   = "user:${each.value.email}"
}

resource "google_folder_iam_member" "team_folders_editor" {
    for_each = var.enabled_users
    folder   = google_folder.team_folders[each.key].id
    role     = "roles/resourcemanager.folderEditor"
    member   = "user:${each.value.email}"
}

resource "google_folder_iam_member" "team_folders_project_create" {
    for_each = var.enabled_users
    folder   = google_folder.team_folders[each.key].id
    role     = "roles/resourcemanager.projectCreator"
    member   = "user:${each.value.email}"
}

resource "google_folder_iam_member" "team_folders_project_delete" {
    for_each = var.enabled_users
    folder   = google_folder.team_folders[each.key].id
    role     = "roles/resourcemanager.projectDeleter"
    member   = "user:${each.value.email}"
}

resource "google_folder_iam_member" "team_folders_admin_iam" {
    for_each = toset(var.admin_users)
    folder   = google_folder.team_folders[element(split("__", each.value), 0)].id
    role     = "roles/resourcemanager.folderAdmin"
    member   = "user:${element(split("__", each.value), 1)}"
}

resource "google_folder" "team_folders" {
    for_each     = var.all_users
    display_name = each.key
    parent       = data.google_folder.parent.id
}
