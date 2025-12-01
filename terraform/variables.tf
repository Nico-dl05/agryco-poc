variable "aws_region"{
    description = "AWS region to deploy resources"
    type        = string
    default     = "eu-west-1"
}
variable "project_name"{
    description = "The name of the project"
    type        = string
    default = "agryco-poc"
}
variable "environment"{
    description = "The environment of the project"
    type        = string
}
variable "tags"{
    description = "Common tags to apply to resources"
    type        = map(string)
    default = {
        Project = "agryco-poc"        
    }   
}