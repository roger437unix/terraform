variable "bucket_name" {
  type        = string
  default     = "roger437unix"
  description = "Name of bucket"
}

variable "env" {
  type        = string
  default     = "development"
  description = "Variável de ambiente"
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Região da AWS que será utilizada"
}
