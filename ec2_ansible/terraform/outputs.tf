output "instance_id" {
 value = aws_instance.ansible_node.id
}

output "internal_ip" {
 value = aws_instance.ansible_node.private_ip
}