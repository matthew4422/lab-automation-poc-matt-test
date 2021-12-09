provider "google" {
    project = "pwc-lab-permissions"
}

provider "azuread" {
  tenant_id = "17334a0e-665e-414f-bf0d-de7b0e7f3025"
}

provider "azurerm" {
  features {}
}