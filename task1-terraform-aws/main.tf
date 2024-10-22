provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_instance" "nginx" {
  ami                    = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (example)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  associate_public_ip_address = true

  user_data = file("${path.module}/startup.sh")

  tags = {
    Name = "nginx-instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.nginx.public_ip
}