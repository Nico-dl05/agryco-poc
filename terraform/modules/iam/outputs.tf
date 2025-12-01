output "processing_role_arn" {
  description = "ARN of the IAM role for processing"
  value       = aws_iam_role.processing_role.arn
}

output "processing_role_name" {
  description = "Name of the IAM role for processing"
  value       = aws_iam_role.processing_role.name
}

output "s3_policy_arn" {
  description = "ARN of the S3 access policy"
  value       = aws_iam_policy.s3_access.arn
}

output "textract_policy_arn" {
  description = "ARN of the Textract access policy"
  value       = aws_iam_policy.textract_aws.arn
}

output "bedrock_policy_arn" {
  description = "ARN of the Bedrock access policy"
  value       = aws_iam_policy.bedrock_access.arn
}