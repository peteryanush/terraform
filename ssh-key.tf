  
# Define ssh to config in instance

# Create default ssh publique key
resource "aws_key_pair" "user_key" {
  key_name   = "terraform"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDU8RBPEziVyvgQwOZejdJW2KGOuLluQmOvXtmpIwh7Zzqjv/LRKax6+KO4ZPXWNUiFI3acUrJJTcIuDS2BeVYGC7SdzNrAAyBs6mY1Zmxp1LoEWyxGoKewW6fwgnZwHAobjBc1J1dj/bEAhTmGRpMlR8OYIdq0bEZ+hSNFvdqHjlKYLibTkn7PJdTY3bzhDmS7QFHnCrp9ShNtiPtUE6vM0ko2sogQIz27s3eYO31daHpM5O/fYlD409BRpbKrOz/SZlqdCsUsvMLQtxSLLQfdm31E7ivynxg4DAMGMXv69lu3ydLwJ78gR4fhchpiRW7f2IiqQ01WxMZcfoWO4ygj dfadmin@terraform.drakontas.com"
}
