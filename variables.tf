variable "location" {
  type        = string
  description = "Azure region for the landing zone."
  default     = "eastus"
}

variable "environment" {
  type        = string
  description = "Environment name used for resource naming."
  default     = "dev"
}

variable "address_space" {
  type        = list(string)
  description = "Hub virtual network address space."
  default     = ["10.40.0.0/16"]
}

