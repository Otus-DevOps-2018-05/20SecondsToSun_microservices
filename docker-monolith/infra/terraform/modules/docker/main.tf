resource "google_compute_instance" "docker" {
  name         = "docker-host-${count.index}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["docker"]

  boot_disk {
    initialize_params {
      image = "${var.docker_disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {}
  }

  metadata {
    sshKeys = "appuser:${file(var.public_key_path)}"
  }
}
