# Security Group

resource "aws_security_group" "common" {
  name = "common"
  description = "common security group"
  vpc_id = "${aws_vpc.vpc.id}"
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "-1"
    self = true
  }
  tags {
    Name = "COMMON"
    TYPE = "securitygroup"
    Region = "${var.region}"
  }
}

resource "aws_security_group" "nat" {
  name = "nat"
  description = "NAT Security Group"
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "NAT"
    TYPE = "securitygroup"
    Region = "${var.region}"
  }
}
 
