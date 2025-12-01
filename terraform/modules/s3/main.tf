resource "aws_s3_bucket" "documents" {
  bucket = var.documents_bucket_name
  tags = merge(
    var.tags,
    {
        name        = "${var.project_name}-documents"
        Project     = var.project_name
        Environment = var.environment
    }
  )
}
resource "aws_s3_bucket" "reports" {
  bucket = var.reports_bucket_name
  tags = merge(
    var.tags,
    {
        name        = "${var.project_name}-reports"
        Project     = var.project_name
        Environment = var.environment
    }
  )
}
resource "aws_s3_bucket_versioning" "documents" {
    bucket = aws_s3_bucket.documents.id
    versioning_configuration {
        status = var.enable_versioning ? "Enabled" : "Suspended"
    }  
}
resource "aws_s3_bucket_versioning" "reports" {
    bucket = aws_s3_bucket.reports.id
    versioning_configuration {
        status = var.enable_versioning ? "Enabled" : "Suspended"
    }  
}
