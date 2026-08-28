resource "google_storage_bucket" "site" {
  name                        = "${var.project_id}-site"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "index" {
  name         = "index.html"
  bucket       = google_storage_bucket.site.name
  source       = "${path.module}/index.html"
  content_type = "text/html"
}

# resource "google_storage_bucket_iam_member" "public_read" {
#   bucket = google_storage_bucket.site.name
#   role   = "roles/storage.objectViewer"
#   member = "allUsers"
# }