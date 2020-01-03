#### INSTANCE DB ####

# Create instance
resource "aws_instance" "db" {
  count         = var.desired_capacity_db
  ami           = var.ami
  instance_type = "t2.large"
  key_name      = aws_key_pair.user_key.key_name
  vpc_security_group_ids = [
    aws_security_group.administration.id,
    aws_security_group.db.id,
  ]
  subnet_id = aws_subnet.http.id
  private_ip = "192.168.1.5${count.index+1}"
  user_data = file("scripts/bootstrap-db.sh")
  tags = {
    Name = "dforce-database${count.index+1}"
  }
}

# Attach floating ip on instance db
resource "aws_eip" "public_db" {
  count      = var.desired_capacity_db
  vpc        = true
  instance   = element(aws_instance.db.*.id, count.index)
  depends_on = [aws_internet_gateway.gw]
  tags = {
    Name = "public-db${count.index}"
  }
}

# Create volume
resource "aws_ebs_volume" "db" {
  count      = var.desired_capacity_db
  availability_zone = element(aws_instance.db.*.availability_zone, count.index)
  size              = 256
}

# Attach volume to instance
resource "aws_volume_attachment" "db" {
  count      = var.desired_capacity_db
  device_name  = "/dev/sdb"
  force_detach = true
  volume_id    = element(aws_ebs_volume.db.*.id, count.index)
  instance_id  = element(aws_instance.db.*.id, count.index)
}
