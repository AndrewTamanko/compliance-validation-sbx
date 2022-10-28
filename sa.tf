#module "service_account" {
#  source = ".\\modules\\terraform-google-pg-sa"#
#
#  project_id                  = "andrew-sbx-sbx-87fc"
#  names                       = ["test-sa"]
#  external_project_roles      = ["roles/iam.serviceAccountUser"]#
#
#}



module "service_accounts" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "4.1.1"

  names      = ["test-sa"]
  project_id = "andrew-sbx-sbx-87fc"

  project_roles = ["roles/iam.serviceAccountUser", "roles/iam.serviceAccountTokenCreator"] # Fails rule "User should not have Service Account User or Service Account Token Creator roles"
}
