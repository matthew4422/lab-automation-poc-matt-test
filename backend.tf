terraform {
  backend "remote" {
    organization = "matt-cloud-eng"

    workspaces {
      name = "lab-automation-poc-matt-test"
    }
  }

  required_version = ">= 0.13.0"
}
