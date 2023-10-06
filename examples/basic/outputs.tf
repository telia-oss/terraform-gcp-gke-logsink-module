output "logging_sink_names" {
  description = "Sink names from the logging module."
  value       = module.gcp_logsink.sink_names
}

output "logging_sink_writer_identities" {
  description = "Writer identities for the logging sinks from the module."
  value       = module.gcp_logsink.sink_writer_identities
}

output "logging_buckets" {
  description = "Bucket IDs from the logging module."
  value       = module.gcp_logsink.buckets
}