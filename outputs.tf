output "sink_writer_identities" {
  description = "The writer identities for each logging sink."
  value       = { for key in toset(local.clusters_key) : key => google_logging_project_sink.sink-bucket[key].writer_identity }
}

output "buckets" {
  description = "The bucket IDs created for each cluster or all clusters."
  value       = { for key in toset(local.clusters_key) : key => google_logging_project_bucket_config.bucket[key].bucket_id }
}

output "sink_names" {
  description = "The names of the logging sinks created."
  value       = { for key in toset(local.clusters_key) : key => google_logging_project_sink.sink-bucket[key].name }
}
