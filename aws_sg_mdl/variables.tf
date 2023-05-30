
variable "ingress_rules" {
  description = "allow ingress to open"
  type = list
  default = ["80", "443", "22"]
}

variable "egress_rules" {
  description = "allow egress to open"
  type = list
  default = ["80", "443", "22"]
}

variable "vpc_id" {}

variable "sg_name" {
  default = "Security Group1"
  }

variable "env" {
  default = "projectname"
}
