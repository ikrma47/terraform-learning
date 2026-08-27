resource "google_storage_bucket" "mastery" {
  name                        = "${var.project_id}-mastery-0"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
}