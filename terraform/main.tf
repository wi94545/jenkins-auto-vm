provider "google" {
  project = "silver-impulse-462505-s4"
  region  = "asia-east1"
  zone    = "asia-east1-b"
}

resource "google_compute_instance" "nginx_vm" {
  name         = "jenkins-nginx-vm"
  machine_type = "e2-micro"
  zone         = "asia-east1-b"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-stream-9"
      size  = 100
    }
  }

  network_interface {
    network = "joe-vpc-1"
    access_config {}
  }

  metadata_startup_script = <<-EOT
  #!/bin/bash
  dnf update -y
  dnf install -y nginx
  systemctl enable nginx
  systemctl start nginx
EOT
}
