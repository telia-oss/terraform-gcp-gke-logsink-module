locals {
  default_filter = "resource.labels.cluster_name=\"${var.cluster_name}\" logName=(\"projects/${var.source_project}/logs/stderr\" OR \"projects/${var.source_project}/logs/stdout\")"
  filter         = var.log_filter_custom != "" ? var.log_filter_custom : local.default_filter
}

resource "google_logging_project_bucket_config" "bucket" {
  project        = var.destination_project
  location       = var.bucket_location
  retention_days = 30
  bucket_id      = "${var.cluster_name}-log-bucket-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 2 # This will generate an 4-character hexadecimal string
}

resource "google_logging_project_sink" "sink-bucket" {
  project                = var.source_project
  name                   = "${var.cluster_name}-logging-sink-${random_id.suffix.hex}"
  destination            = "logging.googleapis.com/${google_logging_project_bucket_config.bucket.id}"
  unique_writer_identity = true
  filter                 = local.filter
}

resource "google_project_iam_binding" "logs-bucket-writer" {
  project = var.destination_project
  role    = "roles/logging.bucketWriter"

  members = [
    google_logging_project_sink.sink-bucket.writer_identity,
  ]
}