variable "eks_name" {
  type        = string
  description = "Nome do cluster EKS:"
}

variable "qtde_nodes" {
  type        = number
  description = "Quantidade desejada de nodes [max 3]:"
 
  validation {
    condition   = var.qtde_nodes <= 3
    error_message = "Quantidade desejada não pode ser superior a três nodes"
  }
}
