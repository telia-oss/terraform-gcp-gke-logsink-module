output "bucket_id" {
  description = "The ID of the created logging bucket."
  value       = google_logging_project_bucket_config.bucket.bucket_id
}

output "sink_name" {
  description = "The name of the created logging sink."
  value       = google_logging_project_sink.sink-bucket.name
}

output "writer_identity" {
  description = "The writer identity of the created logging sink."
  value       = google_logging_project_sink.sink-bucket.writer_identity
}
