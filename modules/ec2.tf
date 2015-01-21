resource "aws_eip" "nat-eip" {
  instance = "${aws_instance.nat.id}"
  vpc = true
}

# NAT Instance
resource "aws_instance" "nat" {
  ami = "${lookup(var.nat_amis, var.region)}"
  instance_type = "t2.micro"
  key_name = "${var.aws_keypair}"
  subnet_id = "${aws_subnet.public-fixable-a.id}"
  security_groups = ["${aws_security_group.common.id}","${aws_security_group.nat.id}"]
  iam_instance_profile = "nat_profile"
  private_ip = "${lookup(var.address_prefix, var.region)}.2.250"
  source_dest_check = false
  count = 1
  tags {
    Name  = "NAT_${var.region}"
    TYPE = "ec2"
    Region = "${var.region}"
  }
}
 
