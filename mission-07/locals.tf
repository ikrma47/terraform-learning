locals {
  name_prefix = "${var.environment}-tf"

  common_labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}