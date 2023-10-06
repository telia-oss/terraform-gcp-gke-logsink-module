# Variables

# Set-like list of unique cluster names to determine the logging targets.
variable "cluster_names" {
  description = "Set-like list of unique cluster names."
  type        = list(string)
}

# A flag to control if logs from multiple clusters should be aggregated into a single sink.
variable "multiple_clusters_per_sink" {
  description = "Boolean to determine if a single sink should handle logs for multiple clusters."
  type        = bool
  default     = false # Default is one cluster per sink
}

# Other essential variables
variable "source_project" {
  description = "The source project ID from where the logs are fetched."
  type        = string
}

variable "destination_project" {
  description = "The destination project ID to where the logs will be stored."
  type        = string
}

# Optional custom log filters if the default isn't suitable.
variable "custom_log_filter" {
  description = "Optional custom filter string for logs that will apply to all clusters."
  type        = string
  default     = ""
}

variable "bucket_location" {
  description = "The location of the logging bucket."
  type        = string
  default     = "europe-north1"
}

variable "retention_days" {
  description = "Number of days to retain log entries."
  type        = number
  default     = 90
}
