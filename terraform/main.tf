terraform {
    required_version = ">=1.14.0"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 6.23.0"
        }
    }
}
provider "aws" {
    region = var.aws_region
    default_tags {
      tags = var.tags   
    }    
}

module "s3" {
    source = "./modules/s3"
    project_name           = var.project_name
    environment            = var.environment
    tags                   = var.tags
    documents_bucket_name  = "${var.project_name}-${var.environment}-documents-bucket"
    reports_bucket_name    = "${var.project_name}-${var.environment}-reports-bucket"
    enable_versioning      = true
}

module "iam" {
    source = "./modules/iam"
    project_name = var.project_name
    environment  = var.environment
    tags         = var.tags
    documents_bucket_arn = module.s3.documents_bucket_arn
    reports_bucket_arn   = module.s3.reports_bucket_arn
}