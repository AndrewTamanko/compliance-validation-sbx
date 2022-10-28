



resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "postgres" {
  name             = "postgres-instance-${random_id.db_name_suffix.hex}"
  database_version = "POSTGRES_14"

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      require_ssl = false # Fails rules "MySQL instance transport encryption should be enabled" if false or null
      #authorized_networks {
      #  
      #    name  = "Public"
      #    value = "0.0.0.0/0" // Should fail rule "Cloud SQL Database Instance should not have a public IP address"
      #  
      #}
      ipv4_enabled = true
    }
  }
}