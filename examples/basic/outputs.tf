
output "created_bucket_id" {
  value = module.gcp_logging.bucket_id
}

output "created_sink_name" {
  value = module.gcp_logging.sink_name
}

output "sink_writer_identity" {
  value = module.gcp_logging.writer_identity
}