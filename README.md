# Terraform Google Cloud Log Sink Module for GKE/Anthos Clusters

This Terraform module is tailored for GKE (Google Kubernetes Engine) and Anthos clusters. It provisions a Google Cloud Logging bucket, creates a sink for collecting logs from a source project related to the cluster, and grants appropriate permissions for the logging bucket in the destination project.

## Usage

```hcl
module "gcp_logging" {
  source              = "telia-oss/gke-logsink-module"
  source_project      = "your-source-project-id"
  destination_project = "your-destination-project-id"
  cluster_name        = "your-cluster-name"
}
```

Replace `YOUR_GITHUB_USERNAME` with your actual GitHub username and the repository URL if different.

## Requirements

- Terraform v0.14 or newer
- A Google Cloud Platform account and project
- Appropriate IAM permissions to create and manage GCP Logging resources
- A GKE or Anthos cluster setup

## Inputs

| Name                | Description                          | Type   | Default | Required |
|---------------------|--------------------------------------|--------|---------|:--------:|
| `source_project`    | The ID of the source GCP project.    | string | n/a     | yes      |
| `destination_project` | The ID of the destination GCP project where logs will be stored. | string | n/a | yes |
| `cluster_name`      | The name of the GKE or Anthos cluster.  | string | n/a     | yes      |
| `log_filter_custom`      | The custom log filter.  | string | n/a    | no      |

### Custom Log Filter

While the module is designed to provide a default logging filter for GKE or Anthos clusters, users have the flexibility to specify a custom filter based on their specific requirements.

#### Usage

To utilize the custom filter option:

1. **Specify the `log_filter_custom` variable** when using the module:

```hcl
module "gcp_logging" {
  source              = "path-to-your-module"
  source_project      = "your-source-project-id"
  destination_project = "your-destination-project-id"
  cluster_name        = "your-cluster-name"
  log_filter_custom   = "YOUR_CUSTOM_FILTER_STRING"
}
```

If you do not provide a value for `log_filter_custom`, the module will use the default filter pattern based on your `source_project` and `cluster_name`.

2. **Custom Filter Format**:

Your custom filter string should conform to the [Logging query language format](https://cloud.google.com/logging/docs/view/advanced-queries). For example:

```
logName="projects/my-project-id/logs/my-log-id"
```

By providing a custom filter, you can fine-tune which logs are routed to the specified sink, allowing for greater control and specificity in your logging setup.
## Outputs

| Name               | Description                                               |
|--------------------|-----------------------------------------------------------|
| `bucket_id`        | The ID of the created logging bucket.                     |
| `sink_name`        | The name of the created logging sink.                     |
| `writer_identity`  | The writer identity of the created logging sink.          |

## License

This module is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.