resource "aws_security_group" "sg_resource" {
  name        = "jenkins" #
  description = "Allow SSH / HTTP traffic" #
  vpc_id      = var.vpc #

  ingress { #
    from_port   = 22 #
    to_port     = 22 #
    protocol    = "tcp" #
    cidr_blocks = ["0.0.0.0/0"] #
  }

  ingress { #
    from_port   = 8080 #
    to_port     = 8080 #
    protocol    = "tcp" #
    cidr_blocks = ["0.0.0.0/0"] #
  }

  egress { #
    from_port       = 0 #
    to_port         = 0 #
    protocol        = "-1" #
    cidr_blocks     = ["0.0.0.0/0"] #
  }

  tags = { #
      Name = var.Name #
      Env =  var.Env #
      Created_by = var.Created_by #
      Dept = var.Dept #
  }
}