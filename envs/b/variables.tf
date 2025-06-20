variable "google_credentials" {
  description = "Base64 encoded GCP service account JSON"
  type        = string
  sensitive   = true
}

variable "project" {}
variable "region" {}
variable "zone" {}
variable "vm_name" {}
variable "machine_type" {}
variable "network" {}
variable "subnetwork" {}
variable "startup_script" {}
variable "disk_size" {}
variable "image" {}
