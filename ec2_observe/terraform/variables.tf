#
# Default vars
#

variable "region" {
 default = "us-east-1"
}

variable "vpc_id" {
 type = string
}

variable "priv_subnet1" {
 type = string
}

variable "priv_subnet2" {
 type = string
}