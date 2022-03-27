variable "aws_access_key" {
  type    = string
  default = "AKIA6DQZW2NL6KKNHD6C"
}

variable "aws_secret_key" {
  type    = string
  default = "g6CR127VyPbBYhQNVx1MQuCTc1Ppm1epRgO5qxGn"
}

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_count" {
  type    = number
  default = 10
}