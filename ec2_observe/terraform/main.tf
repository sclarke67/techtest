
locals {
 EC2_ROOT_VOL_SIZE = 128
}

data "aws_ami" "amazon-linux-2" {
 owners      = ["amazon"]
 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm-2.0.20240529.0-x86_64-gp2"]
 }
}

data "template_cloudinit_config" "observe_node_config" {

   # observe_node_config
   # Need to update and enable SSM to the latest release
   part {
       content_type = "text/x-shellscript"
       content      = <<-EOF
       #!/bin/bash
       sudo systemctl enable amazon-ssm-agent
       sudo systemctl start amazon-ssm-agent
       EOF
   }
   #Configure CloudWatch Logs
   part {
       content_type = "text/x-shellscript"
       content      = <<-EOF
       #!/bin/bash
       sudo yum install -y awslogs
       sudo systemctl stop awslogsd
       cat > /etc/awslogs/awslogs.conf <<EOL
       [general]
       state_file = /var/lib/awslogs/agent-state
       [/var/log/messages]
       datetime_format = %Y-%m-%dT%H:%M:%SZ
       file = /usr/local/bin/sessions/**
       buffer_duration = 5000
       log_stream_name = {instance_id1}
       initial_position = start_of_file
       log_group_name = observe-infra
       EOL
       cat > /etc/awslogs/awscli.conf <<EOL
       [plugins]
       cwlogs = cwlogs
       [default]
       region = ${var.region}
       EOL
       sudo systemctl start awslogsd
       EOF
   }
}

resource "aws_security_group" "observe_node_group" {
   name        = "Observe Node Security Group"
   description = "Observe Node Security Group"
   vpc_id      = var.vpc_id

   ingress {
       from_port       = 3000
       to_port         = 3000
       protocol        = "tcp"
       cidr_blocks     = ["0.0.0.0/0"]
   }

   ingress {
       from_port       = 9090
       to_port         = 9090
       protocol        = "tcp"
       cidr_blocks     = ["0.0.0.0/0"]
   }

   egress {
       from_port       = 0
       to_port         = 0
       protocol        = "-1"
       cidr_blocks     = ["0.0.0.0/0"]

   }
}

data "aws_iam_policy_document" "allow_assume_role" {
   statement {
     effect = "Allow"
     actions = ["sts:AssumeRole"]
     principals {
         type        = "Service"
         identifiers = ["ec2.amazonaws.com", "ssm.amazonaws.com"]
     }
   }

}

resource "aws_iam_role" "instance" {
   name               = "observe_node_role_${var.region}"
   assume_role_policy = data.aws_iam_policy_document.allow_assume_role.json

}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
 for_each = toset([
   "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
   "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
 ])

 role       = aws_iam_role.instance.name
 policy_arn = each.value
}

resource "aws_iam_instance_profile" "this" {
 name = "observe_node_profile_${var.region}"
 role = aws_iam_role.instance.name
}


resource "aws_instance" "observe_node" {

   subnet_id              = var.priv_subnet1
   ami                    = data.aws_ami.amazon-linux-2.id
   instance_type          = "c4.xlarge"
   vpc_security_group_ids = [aws_security_group.observe_node_group.id]
   iam_instance_profile   = aws_iam_instance_profile.this.name

   #Set root vol size to 128 GiB- this can be adjusted as needed for observe
   root_block_device {
       volume_size           = "${local.EC2_ROOT_VOL_SIZE}"
   }

   tags = {
       Name    = "observe-node-${var.region}"
   }

   user_data = data.template_cloudinit_config.observe_node_config.rendered

}