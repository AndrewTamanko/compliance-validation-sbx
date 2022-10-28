

resource "google_dns_managed_zone" "example-zone" {
  name        = "example-zone"
  dns_name    = "example-${random_id.rnd.hex}.com."
  description = "Example DNS zone"
  dnssec_config {
    state = "off" // this should fail rule "Public DNS managed zone should have DNSSEC enabled"
  }
}

resource "random_id" "rnd" {
  byte_length = 4
}