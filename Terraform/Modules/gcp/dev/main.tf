# connect to GCP with terraform
provider "google" {
  credentials = file("terraform.json")
  project     = "gleaming-cove-379523"
  region      = "us-central1"
}

#create a virtual machine
resource "google_compute_instance" "vm" {
  for_each     = var.vm_list
  name         = "${each.value.name}"
  machine_type = "${each.value.machine_type}"
  zone         = "${each.value.zone}"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

