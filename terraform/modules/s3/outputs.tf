output "documents_bucket_id"{
    description = "The ID of the documents S3 bucket"
    value       = aws_s3_bucket.documents.id
}
output "documents_bucket_arn"{
    description = "The ARN of the documents S3 bucket"
    value       = aws_s3_bucket.documents.arn
}
output "documents_bucket_name"{
    description = "The name of the documents S3 bucket"
    value       = aws_s3_bucket.documents.bucket
}
output "reports_bucket_id"{
    description = "The ID of the reports S3 bucket"
    value       = aws_s3_bucket.reports.id
}
output "reports_bucket_arn"{
    description = "The ARN of the reports S3 bucket"
    value       = aws_s3_bucket.reports.arn
}
output "reports_bucket_name"{
    description = "The name of the reports S3 bucket"
    value       = aws_s3_bucket.reports.bucket
}