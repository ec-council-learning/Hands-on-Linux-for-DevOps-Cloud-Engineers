resource "aws_instance" "lab1" {
  ami           = var.AMI
  instance_type = "t2.micro"

  # subnet
  subnet_id = aws_subnet.lab-subnet-public-1.id

  # Security Group
  vpc_security_group_ids = ["${aws_security_group.allow_SSH_HTTP.id}"]

  # the Public SSH key
  key_name = aws_key_pair.lab-region-key-pair.id

  # AZ us-west-2a
  availability_zone = "${var.AZ}"

  # We want a public IP
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true
    iops                  = 100
    volume_size           = 10
    volume_type           = "gp2"
  }

  tags = {
    Name        = "lab1"
    Environment = "LAB"
  }
}

resource "aws_key_pair" "lab-region-key-pair" {
  key_name   = "lab-region-key-pair"
  public_key = file(var.PUBLIC_KEY_PATH)
}


output "ec2-lab-instance" {
  value = aws_instance.lab1.public_ip
}
