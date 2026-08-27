resource "google_storage_bucket" "scratch" {
  name                        = "${var.project_id}-tf-scratch"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
}