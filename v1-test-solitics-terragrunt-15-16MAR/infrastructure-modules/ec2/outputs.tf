output "instance_ids" {
  value = tolist(aws_instance.web.*.id)
}

output "instance_public_ips" {
  value = tolist(aws_instance.web.*.public_ip)
}