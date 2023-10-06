module "gcp_logsink" {
  source              = "../../"                                                 # Replace with your module's source
  source_project      = ""                               # Example source project ID, replace with actual value
  destination_project = ""                                   # Example destination project ID, replace with actual value
  cluster_names       = [""] # Example GKE/Anthos cluster name, replace with actual value
  # custom_log_filter   = "your_custom_filter_string"
  # retention_days      = 45  # Default is 90 days
}