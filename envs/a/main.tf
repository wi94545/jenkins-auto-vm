provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
  credentials = base64decode(var.google_credentials)
}

module "vm" {
  source         = "../../modules/compute_instance"
  name           = var.vm_name
  machine_type   = var.machine_type
  zone           = var.zone
  image          = var.image
  disk_size      = var.disk_size
  network        = var.network
  subnetwork     = var.subnetwork
  startup_script = var.startup_script
}
