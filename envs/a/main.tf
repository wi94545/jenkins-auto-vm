variable "google_credentials" {
  description = "Base64 encoded GCP service account JSON"
  type        = string
  sensitive   = true
}

provider "google" {
  project     = "silver-impulse-462505-s4"
  region      = "asia-east1"
  zone        = "asia-east1-c"
  credentials = base64decode(var.google_credentials)
}

module "nginx_vm" {
  source         = "../../modules/compute_instance"
  name           = "jenkins-nginx-vm-a"
  machine_type   = "e2-medium"
  zone           = "asia-east1-c"
  image          = "centos-cloud/centos-stream-9"
  disk_size      = 100
  network        = "joe-vpc-1"
  subnetwork     = "joe-test2"
  startup_script = "${path.module}/../../modules/compute_instance/startup-scripts/a.sh"
}
