output "instance_ip" {
  value = aws_instance.web_instance.public_ip
}

output "instance_private_ip" {
  value = aws_instance.web_instance.private_ip
}

output "vpc_data" {
  # value = aws_vpc.web_vpc
  value = data.aws_vpc.existing_vpc
  # sensitive = true
}

output "output_value" {
  value = "tuts"
}
