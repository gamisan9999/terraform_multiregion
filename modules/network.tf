# VPC Network
resource "aws_vpc" "vpc" {
  cidr_block = "${lookup(var.address_prefix, var.region)}.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags  {
    Name = "vpc_${var.region}"
    Type = "vpc"
    Region = "${var.region}"
  }
}


#  subnets
resource "aws_subnet" "public-variable-a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${lookup(var.address_prefix, var.region)}.0.0/23"
  availability_zone = "${var.region}a"
  tags  {
    Name = "public-subnet-${var.region}a"
    TYPE = "subnet"
    Region = "${var.region}"
  } 
}

resource "aws_subnet" "public-fixable-a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${lookup(var.address_prefix, var.region)}.2.0/23"
  availability_zone = "${var.region}a"
  tags  {
    Name = "public-fixable-${var.region}a"
    TYPE = "subnet"
    Region = "${var.region}"
  } 
}

resource "aws_subnet" "protected-variable-a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${lookup(var.address_prefix, var.region)}.32.0/23"
  availability_zone = "${var.region}a"
  tags  {
    Name = "protected-variable-${var.region}a"
    TYPE = "subnet"
    Region = "${var.region}"
  } 
}

resource "aws_subnet" "protected-fixable-a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${lookup(var.address_prefix, var.region)}.34.0/23"
  availability_zone = "${var.region}a"
  tags  {
    Name = "protected-fxiable-${var.region}a"
    TYPE = "subnet"
    Region = "${var.region}"
  } 
}

resource "aws_subnet" "private-variable-a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${lookup(var.address_prefix, var.region)}.64.0/23"
  availability_zone = "${var.region}a"
  tags  {
    Name = "private-variable-${var.region}a"
    TYPE = "subnet"
    Region = "${var.region}"
  } 
}

resource "aws_subnet" "private-fixable-a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${lookup(var.address_prefix, var.region)}.66.0/23"
  availability_zone = "${var.region}a"
  tags  {
    Name = "private-fxiable-${var.region}a"
    TYPE = "subnet"
    Region = "${var.region}"
  }
}

# IGW
resource "aws_internet_gateway" "internet_gw" {
  vpc_id = "${aws_vpc.vpc.id}"
}

# route table
resource "aws_route_table" "public-route" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gw.id}"
  }
  tags  {
    Name = "public_route"
    vpc_id = "${aws_vpc.vpc.id}"
    TYPE = "route_table"
  } 
}

# associate route table
resource "aws_route_table_association" "public-variable-a_route_associate" {
  subnet_id =  "${aws_subnet.public-variable-a.id}"
  route_table_id = "${aws_route_table.public-route.id}"
}

resource "aws_route_table_association" "public-fixable-a_route_associate" {
  subnet_id =  "${aws_subnet.public-fixable-a.id}"
  route_table_id = "${aws_route_table.public-route.id}"
}
