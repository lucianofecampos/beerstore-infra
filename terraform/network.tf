resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_default}"

  tags {
    Name = "hibicode"
  }
}

resource "aws_subnet" "main_subnets" {
  count = 6

  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet(var.cidr_default, 8, count.index + 1)}"
  availability_zone = "${var.availability_zones[count.index]}"

  tags {
    Name = "hc_subnet_${count.index}"
  }
}
