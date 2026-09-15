output "network_id" {
  description = "ID of the VPC."
  value = google_compute_network.main.id
}
output "subnet_ids" {
  description = "Map of subnet name to subnet ID."
  value = { for k, v in google_compute_subnetwork.app: k => v.id }
}