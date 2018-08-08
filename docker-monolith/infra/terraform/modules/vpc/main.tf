resource "google_compute_firewall" "firewall_docker" {
  name    = "default-allow-docker"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292","22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker"]
}
