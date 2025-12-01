output "documents_bucket_id"{
    description = "The ID of the documents S3 bucket"
    value       = module.s3.documents_bucket_id
}

output "documents_bucket_name"{
    description = "The name of the documents S3 bucket"
    value       = module.s3.documents_bucket_name
}

output "documents_bucket_arn"{
    description = "The ARN of the documents S3 bucket"
    value       = module.s3.documents_bucket_arn
}

output "reports_bucket_id"{
    description = "The ID of the reports S3 bucket"
    value       = module.s3.reports_bucket_id
}

output "reports_bucket_name"{
    description = "The name of the reports S3 bucket"
    value       = module.s3.reports_bucket_name
}

output "reports_bucket_arn"{
    description = "The ARN of the reports S3 bucket"
    value       = module.s3.reports_bucket_arn
}

output "processing_role_arn"{
    description = "ARN of the IAM role for processing"
    value       = module.iam.processing_role_arn
}

output "processing_role_name"{
    description = "Name of the IAM role for processing"
    value       = module.iam.processing_role_name
}

output "region"{
    description = "The AWS region where resources are deployed"
    value       = var.aws_region
}