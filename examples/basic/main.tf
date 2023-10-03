module "gcp_logging" {
  source              = "../../"                   # Replace with your module's source
  source_project      = ""     # Example source project ID, replace with actual value
  destination_project = ""     # Example destination project ID, replace with actual value
  cluster_name        = ""     # Example GKE/Anthos cluster name, replace with actual value
}