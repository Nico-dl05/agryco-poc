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
variable "documents_bucket_arn"{
    description = "ARN of the documents S3 bucket"
    type        = string
}

variable "reports_bucket_arn" {            
    description = "ARN of the reports S3 bucket"
    type        = string
}          