resource "aws_security_group" "allow-ssh" {
  name = "allow-ssh"

  #Incoming traffic
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }


  #Incomming traffic for php-application
  ingress {
    from_port = 18080
    to_port   = 18082
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  #Incomming traffic for http
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  #Incomming traffic for https
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  #Outgoing traffic for php-application
  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }
}