resource "terraform_data" "startup" {
  triggers_replace = filesha256("${path.module}/startup.sh.tftpl")
}

data "google_compute_zones" "available" {
  region = var.region
}

data "google_compute_image" "debian" {
  family  = "debian-12"
  project = "debian-cloud"
}