variable "device_name" {
  type        = string
  description = "device volume name"
  default     = "/dev/sdf"
}

variable "size" {
  type        = number
  description = "device volume name"
  default     = 10
}

variable "AZ" {
  type        = string
  description = "availability zone"
  
}

variable "instance_id" {}