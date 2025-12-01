data "aws_caller_identity" "current" {}

resource "aws_iam_role" "processing_role"{
    name = "${var.project_name}-processing-role-${var.environment}"
    assume_role_policy = jsonencode({
        version = "2012-10-17"
        Statement = [
            {
                action = "sts:AssumeRole"
                effect = "Allow"
                principal = {
                    AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
                }
            }
        ]
    })
    tags = merge(
        var.tags,
        {
            Project     = var.project_name
            Environment = var.environment
        }
    )
}

resource "aws_iam_policy" "s3_access" {
  name        = "${var.project_name}-s3-access-${var.environment}"
  description = "Allows read/write access to Agryco S3 buckets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          var.documents_bucket_arn, 
          "${var.documents_bucket_arn}/*",
          var.reports_bucket_arn,
          "${var.reports_bucket_arn}/*"
        ]
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name        = "${var.project_name}-s3-access"
      Project     = var.project_name
      Environment = var.environment
    }
  )
}

resource "aws_iam_policy" "textract_aws"{
    name = "${var.project_name}-textract-policy-${var.environment}"
    description = "Allows access to AWS Textract for OCR processing"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Action = [
                    "textract:AnalyzeDocument",
                    "textract:DetectDocumentText",
                    "textract:GetDocumentAnalysis",
                    "textract:GetDocumentTextDetection",
                    "textract:StartDocumentAnalysis",
                    "textract:StartDocumentTextDetection"
                ]
                Resource = "*"
            }
        ]
    })
    tags = merge(
        var.tags,
        {
            Name        = "${var.project_name}-textract-policy"
            Project     = var.project_name
            Environment = var.environment   
        }
    )
}

resource "aws_iam_policy" "bedrock_access"{
    name = "${var.project_name}-bedrock-access-${var.environment}"
    description = "Allows access to AWS Bedrock for LLM processing"

    policy = jsonencode({
        Version= "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Action = [
                    "bedrock:InvokeModel",
                    "bedrock:InvokeModelWithResponseStream"
                ]
                Resource = "arn:aws:bedrock*::foundation-model/*"
            }
        ]
    })
    tags = merge(
        var.tags,
        {
            Name        = "${var.project_name}-bedrock-access"
            Project     = var.project_name
            Environment = var.environment   
        }
    )
}
resource "aws_iam_role_policy_attachment" "s3_access" {
  role = aws_iam_role.processing_role.name
    policy_arn = aws_iam_policy.s3_access.arn
}
resource "aws_iam_role_policy_attachment" "textract_access" {
    role       = aws_iam_role.processing_role.name
    policy_arn = aws_iam_policy.textract_aws.arn
}
resource "aws_iam_role_policy_attachment" "bedrock_access" {
    role       = aws_iam_role.processing_role.name
    policy_arn = aws_iam_policy.bedrock_access.arn
}