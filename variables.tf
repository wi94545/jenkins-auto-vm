variable "google_credentials" {
  type      = string
  sensitive = true
}

variable "project" {}
variable "region" {}
variable "zone" {}

variable "vm_name" {}
variable "machine_type" {}
variable "network" {}
variable "subnetwork" {}
variable "startup_script" {}

