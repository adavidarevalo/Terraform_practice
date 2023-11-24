resource "aws_instance" "server1" {
    ami = var.ami_instance
    instance_type = var.instance_type
    subnet_id = aws_subnet.Public_Subnet_1.id
    count = length(var.subnet1_private_ip_address)
    associate_public_ip_address = true
    key_name = aws_key_pair.key-class1.id
    tags = {
      Name = "server-${count.index + 1}",
      Owner = "terraform",
      Env = "dev"
    }
    vpc_security_group_ids = [aws_security_group.SG_main.id]
    user_data = file("userData.sh")
    private_ip = element(var.subnet1_private_ip_address, count.index)
}

################################################################
variable "subnet1_private_ip_address" {
    type = list(string)
    default = ["192.168.10.11", "192.168.10.12", "192.168.10.13"]
}