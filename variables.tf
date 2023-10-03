variable "source_project" {
  description = "The source project name."
  type        = string
}

variable "destination_project" {
  description = "The destination project name where logs will be sent."
  type        = string
}

variable "cluster_name" {
  description = "The cluster name."
  type        = string
}

variable "bucket_location" {
  description = "The location for the destination bucket."
  type        = string
  default     = "europe-north1"
}
variable "log_filter_custom" {
  description = "Optional: Specify a custom filter if needed. If not provided, a default filter based on source_project and cluster_name will be used."
  type        = string
  default     = ""
}