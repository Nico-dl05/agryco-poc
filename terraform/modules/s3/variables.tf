variable "project_name"{
    description = "The name of the project"
    type        = string
}
variable "environment" {
    description = "The environment of the project"
    type        = string
}
variable "tags"{
    description = "Common tags to apply to resources"
    type        = map(string)
}
variable "documents_bucket_name"{
    description = "The name of the S3 bucket for documents"
    type        = string
}
variable "reports_bucket_name" {
  description = "The name of the S3 bucket for reports"
  type        = string
}
variable "enable_versioning"{
    description = "Enable versioning for S3 buckets"
    type        = bool
    default     = false
}
