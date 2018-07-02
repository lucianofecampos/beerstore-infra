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

  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}", "${aws_security_group.allow_outbound.id}"]

  key_name = "${aws_key_pair.keypair.key_name}"

  tags = {
    Name = "hibicode_instances"
  }

  depends_on = ["aws_internet_gateway.igw"]
}

data "template_file" "hosts" {
  template = "${file("./template/hosts.tpl")}"

  vars {
    PUBLIC_IP_0 = "${aws_instance.instances.*.public_ip[0]}"
    PUBLIC_IP_1 = "${aws_instance.instances.*.public_ip[1]}"
    PUBLIC_IP_2 = "${aws_instance.instances.*.public_ip[2]}"
  }
}

resource "local_file" "hosts" {
  content  = "${data.template_file.hosts.rendered}"
  filename = "./template/hosts"
}
