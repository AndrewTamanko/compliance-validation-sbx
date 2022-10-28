resource "google_compute_instance" "default" {
  name           = "test"
  machine_type   = "e2-medium"
  zone           = "us-central1-a"
  can_ip_forward = true # Should Fail rule "Virtual Machine should not have IP Forwarding enabled"

  tags = []

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {                # Fails rule: Metadata not include block-project-ssh-keys = true fails "Virtual Machine should block project-wide SSH keys"
    serial-port-enable = true # Fails rule "Virtual Machine connection through serial ports should not be enabled"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    email  = "tamanko.an@pg.com"
    scopes = ["cloud-platform"] # Fails rule "Virtual Machine should not use the default Compute Engine service account with full API access"
  }
}