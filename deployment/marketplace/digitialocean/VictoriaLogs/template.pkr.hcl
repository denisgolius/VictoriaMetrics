variable "token" {
  type        = string
  default     = "${env("DIGITALOCEAN_API_TOKEN")}"
  description = "DigitalOcean API token used to create droplets."
}

variable "image_id" {
  type        = string
  default     = "ubuntu-24-04-x64"
  description = "DigitalOcean linux image ID."
}

variable "victorialogs_version" {
  type        = string
  default     = "${env("VL_VERSION")}"
  description = "Version number of the desired VictoriaLogs binary."
}

variable "image_name" {
  type        = string
  default     = "victorialogs-snapshot-{{timestamp}}"
  description = "Name of the snapshot created on DigitalOcean."
}

source "digitalocean" "default" {
  api_token     = "${var.token}"
  image         = "${var.image_id}"
  region        = "nyc3"
  size          = "s-1vcpu-1gb"
  snapshot_name = "${var.image_name}"
  ssh_username  = "root"
}

build {
  sources = ["source.digitalocean.default"]

  provisioner "file" {
    destination = "/etc/"
    source      = "files/etc/"
  }

  provisioner "file" {
    destination = "/var/"
    source      = "files/var/"
  }

  # Setup instance configuration
  provisioner "shell" {
    environment_vars = [
      "DEBIAN_FRONTEND=noninteractive"
    ]
    scripts = [
      "scripts/01-setup.sh",
      "scripts/02-firewall.sh",
    ]
  }

  # Install VictoriaLogs
  provisioner "shell" {
    environment_vars = [
      "VL_VERSION=${var.victorialogs_version}",
      "DEBIAN_FRONTEND=noninteractive"
    ]
    scripts = [
      "scripts/04-install-victorialogs.sh",
    ]
  }

  # Cleanup and validate instance
  provisioner "shell" {
    environment_vars = [
      "DEBIAN_FRONTEND=noninteractive"
    ]
    scripts = [
      "scripts/89-cleanup-logs.sh",
      "scripts/90-cleanup.sh",
      "scripts/99-img-check.sh"
    ]
  }
}
