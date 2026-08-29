output "bucket_name" {
  description = "Name of the site bucket"
  value       = google_storage_bucket.site.name
}