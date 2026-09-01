output "web_ip" {
  description = "Public IP of the web VM."
  value = google_compute_instance.web.network_interface[0].access_config[0].nat_ip
}