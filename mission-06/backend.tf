terraform {
  backend "gcs" {
    prefix = "learning/mission-06"
    bucket = "gcpsandboxgeneral-tfstate"
  }
}