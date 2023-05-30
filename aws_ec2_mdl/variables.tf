variable "instance-type" {
  description = "Server Size for WebServer"
  type        = string
  default     = "t3.micro"
}

variable "name" {
  description = "Instace name"
  type        = string
  default     = "core"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "instance-name" {
  description = "Instance name and other ec2 tags"
  type        = map
  default = {
    Name       = "Default Name"
  }
}

