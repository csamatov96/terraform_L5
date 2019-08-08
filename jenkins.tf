resource "aws_instance" "jenkins" { #1. creating an actual instance 
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "${aws_key_pair.developer_key.id}" #was name ???
    associate_public_ip_address = true
    security_groups = ["${aws_security_group.jenkins.name}"] #id or name ???

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
            "sudo yum install java-1.8.0-openjdk-devel -y",
            "curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo",
            "sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key",
            "sudo yum install jenkins",
            "sudo systemctl start jenkins"
        ]
    }
}