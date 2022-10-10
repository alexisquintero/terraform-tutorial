variable "var_instance_type" {
  type = string
  default = "t2.micro"
  description = "instance type"
}

variable "var_instance_tags" {
  type = object({
    Name = string
    foo  = number
  })
}

variable "var_instance_count" { }
