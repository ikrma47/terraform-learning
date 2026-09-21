resource "google_project_service" "secretmanager" {
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_secret_manager_secret" "db_password" {
  secret_id = "${local.name_prefix}-db-password"

  replication {
    auto {}
  }

  depends_on = [google_project_service.secretmanager]
}

resource "google_secret_manager_secret_version" "db_password" {
  secret                 = google_secret_manager_secret.db_password.id
  secret_data_wo         = var.db_password
  secret_data_wo_version = 1
}

resource "google_service_account" "app" {
  account_id = "${local.name_prefix}-app"
  display_name = "App runtime id"
}

resource "google_secret_manager_secret_iam_member" "app_reads_password" {
  secret_id = google_secret_manager_secret.db_password.id
  role = "roles/secretmanager.secretAccessor"
  member = "serviceAccount:${google_service_account.app.email}"
}

ephemeral "google_secret_manager_secret_version" "db_password" {
  secret = google_secret_manager_secret.db_password.id
}