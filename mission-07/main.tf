check "subnets_are_in_region" {
  assert {
    condition     = alltrue([for s in var.subnets : s.region == var.region])
    error_message = "Some subnets are outside the provider's default region."
  }
}

module "network" {
  source = "./modules/network"

  allowed_ports = var.allowed_ports
  name_prefix   = local.name_prefix
  region        = var.region
  subnets       = var.subnets
}

resource "google_project_service" "secretmanager" {
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = false
}

# resource "google_secret_manager_secret" "db_password" {
#   secret_id = "${local.name_prefix}-db-password"

#   replication {
#     auto {
#     }
#   }

#   depends_on = [google_project_service.secretmanager]
# }