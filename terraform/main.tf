provider "google" {
  project = "your-gcp-project-id"
  region  = "asia-east1"
  zone    = "asia-east1-b"
}

resource "google_compute_instance" "nginx_vm" {
  name         = "jenkins-nginx-vm"
  machine_type = "e2-micro"
  zone         = "asia-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "your-vpc-name"
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
  EOT
}
