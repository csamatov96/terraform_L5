resource "aws_instance" "example" { #1. creating an actual instance 
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}" #
    associate_public_ip_address = true
    security_groups = ["${aws_security_group.example.name}"] #id or name ???

    #2. establishing a connection
    provisioner "remote-exec" {  
        connection  {
            host = "${self.public_ip}"
            type = "ssh" #or 
            user = "${var.user}" #ec2-user 
            private_key = "${file("~/.ssh/id_rsa")}" #use that key whenever it creates an instance 
        }

        #3. running an actual tasks
        #https://linuxize.com/post/how-to-install-jenkins-on-centos-7/
        inline = [ 
            "sudo yum install telnet -y",
            "",
            "",
            "",
            "",
        ]
    }
}