variable "container_name" {
  description = "Name of the Docker container"
  type        = string
  default     = "devops-lab-web"
}

variable "internal_port" {
  description = "Internal container port"
  type        = number
  default     = 80
}

variable "external_port" {
  description = "Host port exposed by the container"
  type        = number
  default     = 8081
}

variable "image_name" {
  description = "Docker image to use"
  type        = string
}