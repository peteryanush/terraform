#### INSTANCE HTTP ####

# Create instance
resource "aws_instance" "http" {
  count         = var.desired_capacity_http
  ami           = var.ami
  instance_type = "t2.large"
  key_name      = aws_key_pair.user_key.key_name
  vpc_security_group_ids = [
    aws_security_group.administration.id,
    aws_security_group.web.id,
  ]
  subnet_id = aws_subnet.http.id
  private_ip = "192.168.1.1${count.index+1}"
  user_data = file("scripts/bootstrap-app.sh")
  root_block_device {
    volume_type = "gp2"
    volume_size = "50"
  }
  tags = {
    Name = "dforce-app${count.index+1}"
  }
}

# Attach floating ip on instance http
resource "aws_eip" "public_http" {
  count      = var.desired_capacity_http
  vpc        = true
  instance   = element(aws_instance.http.*.id, count.index)
  depends_on = [aws_internet_gateway.gw]
  tags = {
    Name = "public-http${count.index}"
  }
}
