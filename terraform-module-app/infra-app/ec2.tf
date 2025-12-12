# key pair (login)
resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("terra-key-ec2.pub")

  tags = {
    Environment= var.env
  }

}
# vpc
resource "aws_default_vpc" "default" {

}
#security group
resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-app-sg"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = aws_default_vpc.default.id #interpolation syntax
  #inbound rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access from anywhere"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access from anywhere"
  }

  #outbound rule
  egress {
    from_port   = 0 #you can remove this from and to port as protocol -1 means all traffic
    to_port     = 0
    protocol    = "-1" # all traffic
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}

# ec2 instance
resource "aws_instance" "my_ec2" {
  count= var.instance_count
 
  depends_on = [aws_security_group.my_security_group, aws_key_pair.my_key]  #to create ec2 instance after creating security group and key pair
  
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  #instance_type = var.ec2_instance_type
  instance_type = var.instance_type             #to get instance type from for_each
  ami           = var.ec2_ami_id              #ubantu 20.04 in ap-south-1
  
  root_block_device {
    volume_size = var.env == "prod" ? 20 : 10
    volume_type = "gp3"
  }
  tags = {
    Name = "${var.env}-infra-app-ec2 "
    environment = var.env
  }
}
