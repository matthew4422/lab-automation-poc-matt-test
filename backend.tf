terraform {
  backend "remote" {
    organization = "pwc-ca-cloud-eng"

    workspaces {
      name = "lab-automation-poc"
    }
  }

  required_version = ">= 0.13.0"
}
