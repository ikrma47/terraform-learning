resource "google_compute_firewall" "allow_internal" {
  name          = "${local.name_prefix}-allow-internal"
  network       = google_compute_network.main.id
  source_ranges = ["10.0.0.0/16"]

  dynamic "allow" {
    for_each = var.allowed_ports

    content {
      protocol = allow.key
      ports    = allow.value
    }
  }
}

resource "google_compute_firewall" "allow-http" {
  name          = "${local.name_prefix}-allow-http"
  network       = google_compute_network.main.id
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  lifecycle {
    ignore_changes = [ description ]
  }
}

resource "google_compute_firewall" "allow_ssh" {
  name          = "${local.name_prefix}-allow-ssh"
  network       = google_compute_network.main.id
  source_ranges = ["153.117.125.66/32"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_subnetwork" "app" {
  for_each = var.subnets

  name          = "${local.name_prefix}-${each.key}"
  ip_cidr_range = each.value.cidr
  region        = each.value.region
  network       = google_compute_network.main.id
}

resource "google_compute_network" "main" {
  name                    = "${local.name_prefix}-vpc"
  auto_create_subnetworks = false

  lifecycle {
    prevent_destroy = true
  }
}
