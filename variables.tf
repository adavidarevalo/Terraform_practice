variable "aws_region" {
    type = string
  default = "us-east-2"
}

variable "ami_instance" {
  type = string
  default = "ami-06d4b7182ac3480fa"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}