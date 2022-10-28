

resource "google_compute_ssl_policy" "custom-ssl-policy" {
  name            = "custom-ssl-policy"
  min_tls_version = "TLS_1_0" // This should fail rule ""
  profile         = "CUSTOM"
  custom_features = ["TLS_RSA_WITH_3DES_EDE_CBC_SHA", "TLS_RSA_WITH_AES_256_GCM_SHA384"]
}