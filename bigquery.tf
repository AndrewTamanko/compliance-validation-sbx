resource "google_bigquery_dataset" "default" {
  dataset_id                  = "foo"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "EU"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }
}


resource "google_bigquery_dataset_access" "access" {
  dataset_id    = google_bigquery_dataset.dataset.dataset_id
  special_group = "allAuthenticatedUsers" // This should fail rule "BigQuery Datasets should be private"
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id = "example_dataset"
}

resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}
