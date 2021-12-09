provider "google" {
    project = "pwc-lab-permissions"
}

provider "azuread" {
  tenant_id = "c2034e74-3018-47d7-9fa6-097954cb669c"
}

provider "azurerm" {
  features {}
}