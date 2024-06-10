output "instance_id" {
 value = aws_instance.observe_node.id
}

output "internal_ip" {
 value = aws_instance.observe_node.private_ip
}