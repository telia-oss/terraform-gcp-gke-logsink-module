# Local Variables

# Determines the naming scheme. If aggregating logs, all clusters will fall under "all_clusters".
locals {
  clusters_key = var.multiple_clusters_per_sink ? ["all_clusters"] : var.cluster_names

  default_filter_for_all = "logName=(\"projects/${var.source_project}/logs/stderr\" OR \"projects/${var.source_project}/logs/stdout\")"

  # Use the custom filter if provided; otherwise, use the default
  filter = var.custom_log_filter != "" ? var.custom_log_filter : local.default_filter_for_all
}

# Resources

# Bucket configuration to store logs.
resource "google_logging_project_bucket_config" "bucket" {
  for_each = toset(local.clusters_key)

  project        = var.destination_project
  location       = var.bucket_location
  retention_days = var.retention_days
  bucket_id      = "${each.key}-log-bucket-${random_id.suffix[each.key].hex}"
}

# Generates a random suffix to ensure uniqueness of resources.
resource "random_id" "suffix" {
  for_each = toset(local.clusters_key)

  byte_length = 2 # Generates a 4-character hexadecimal string
}

# Sink configuration to direct logs from the source to the destination.
resource "google_logging_project_sink" "sink-bucket" {
  for_each = toset(local.clusters_key)

  project                = var.source_project
  name                   = "${each.key}-logging-sink-${random_id.suffix[each.key].hex}"
  destination            = "logging.googleapis.com/${google_logging_project_bucket_config.bucket[each.key].id}"
  unique_writer_identity = true
  filter                 = local.filter
}

# IAM bindings to allow the sink to write logs to the bucket.
resource "google_project_iam_binding" "logs-bucket-writer" {
  for_each = toset(local.clusters_key)

  project = var.destination_project
  role    = "roles/logging.bucketWriter"

  members = [
    google_logging_project_sink.sink-bucket[each.key].writer_identity,
  ]
}
