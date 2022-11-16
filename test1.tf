provider "aws" {
  region = "us-west-1"
}

resource "aws_security_group" "allow_exact_invalid" {
  name        = "allow_exact_invalid"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 11215
    to_port     = 11215
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "MyVPC"
  }
}

resource "aws_security_group" "allow_include_invalid" {
  name        = "allow_include_invalid"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 11214
    to_port     = 11216
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_all_invalid" {
  name        = "allow_all_invalid"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_all_invalid_rule" {
  name        = "allow_all_invalid for rule"
  description = "Allow all inbound traffic"
}

resource "aws_security_group_rule" "allow_all_invalid" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["10.10.10.10/32", "0.0.0.0/0"]
  security_group_id = aws_security_group.allow_all_invalid_rule.id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound from anywhere"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.remote_user_addr
  }
}

resource "aws_security_group" "allow_ssh_terraform_tfvars" {
  name        = "allow_ssh"
  description = "Allow SSH inbound from anywhere"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.remote_user_addr_terraform_tfvars
  }
}

resource "aws_security_group" "allow_ssh_a_auto_tfvars" {
  name        = "allow_ssh"
  description = "Allow SSH inbound from anywhere"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.remote_user_addr_a_auto_tfvars
  }
}

resource "aws_security_group" "allow_ssh_b_auto_tfvars" {
  name        = "allow_ssh"
  description = "Allow SSH inbound from anywhere"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.remote_user_addr_b_auto_tfvars
  }
}

resource "aws_security_group" "allow_ssh_locals" {
  name        = "allow_ssh"
  description = "Allow SSH inbound from anywhere"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = local.remote_user_addr
  }
}

locals {
  remote_user_addr = local.remote_user_addr_tmp
  remote_user_addr_tmp = ["0.0.0.0/0"]
}
