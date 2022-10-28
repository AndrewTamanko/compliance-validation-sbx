resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"] # Fails rule "VPC firewall should restrict SSH access" 
  }
  allow {
    protocol = "udp"
    ports    = ["22", "3389"] # Fails rule "VPC firewall should restrict SSH access" 
  }
  source_ranges = ["0.0.0.0/0"] # Fails rule "VPC firewall should restrict SSH access" and ""
  source_tags   = ["web"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}