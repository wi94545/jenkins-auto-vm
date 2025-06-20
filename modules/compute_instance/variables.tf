variable "name" {
  description = "VM instance name"
  type        = string
}

variable "machine_type" {
  description = "The machine type to create"
  type        = string
}

variable "zone" {
  description = "The zone to deploy the VM"
  type        = string
}

variable "image" {
  description = "Boot disk image"
  type        = string
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
}

variable "network" {
  description = "VPC network name"
  type        = string
}

variable "subnetwork" {
  description = "VPC subnetwork name"
  type        = string
}

variable "startup_script" {
  description = "Startup script content"
  type        = string
}

