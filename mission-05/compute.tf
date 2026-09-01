data "google_compute_zones" "available" {
  region = var.region
}

data "google_compute_image" "debian" {
  family  = "debian-12"
  project = "debian-cloud"
}