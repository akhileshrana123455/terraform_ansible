resource "aws_instance" "web" {
	ami = "ami-04db49c0fb2215364"
	instance_type = "t2.micro"
	subnet_id = "subnet-00a9d74c"
	key_name = "mykey1"
	vpc_security_group_ids = ["sg-05b5cb516173badca"]
	provisioner "remote-exec" {
		inline = ["sudo yum install -y python3"]
		connection {
     	 		host        = "${aws_instance.web.public_ip}"
      			type        = "ssh"
      			user        = "ec2-user"
			private_key = "${file(var.ssh_key_private)}"
      
    		}
	}
	provisioner "local-exec" {
		command = "ansible-playbook -u ec2-user -i '${self.public_ip},' --private-key ${var.ssh_key_private} ec2.yaml"
	}
		
}
