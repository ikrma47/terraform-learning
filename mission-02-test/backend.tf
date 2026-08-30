terraform {
  backend "gcs" {
    bucket = "gcpsandboxgeneral-tfstate"
    prefix = "learning/mission-02-test"
  }
}