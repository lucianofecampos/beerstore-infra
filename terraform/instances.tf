resource "aws_key_pair" "keypair" {
  key_name   = "hibicode"
  public_key = "${file("keys/id_rsa.pub")}"
}

resource "aws_instance" "instances" {
  count = 3

  ami           = "${var.aws_linux_ami}"
  instance_type = "${var.instance_type}"

  associate_public_ip_address = true

  subnet_id = "${element(aws_subnet.public_subnet.*.id, count.index)}"

  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]

  key_name = "${aws_key_pair.keypair.key_name}"

  tags = {
    Name = "hibicode_instances"
  }
}
