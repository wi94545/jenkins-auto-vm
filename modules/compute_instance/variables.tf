variable "name" {}
variable "machine_type" {}
variable "zone" {}
variable "image" {
  description = "GCP image to use for the VM"
  type        = string
}
variable "disk_size" {
  description = "Size of the boot disk in GB"
  type        = number
}
variable "network" {}
variable "subnetwork" {}
variable "startup_script" {}

