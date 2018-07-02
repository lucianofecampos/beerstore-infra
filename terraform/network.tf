resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_default}"

  tags {
    Name = "hibicode"
  }
}

resource "aws_subnet" "public_subnet" {
  count = 3

  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${cidrsubnet(var.cidr_public, 2, count.index)}"
  availability_zone       = "${var.availability_zones[count.index]}"
  map_public_ip_on_launch = true

  tags {
    Name = "hibicode_public_subnet_${count.index}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = 3

  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet(var.cidr_private, 2, count.index)}"
  availability_zone = "${var.availability_zones[count.index]}"

  tags {
    Name = "hibicode_private_subnet_${count.index}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "hibicode-igw"
  }
}
