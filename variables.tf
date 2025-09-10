variable "aws_region" {
    type = string
    default = "ca-central-1"
    description = "AWS Region"
}

variable "ami_id" {
    type = string
    default = "ami-0ca3fe9992272540b"
    description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "EC2 instance type"
}

variable "server_name" {
    type = string
    default = "WebServer"
}

variable "common_tags" {
    type = map(string)
    default = {
        "ManagedBy" = "Chib"
        "Environment" = "Development"
    }
}

variable "availability_zone" {
    type = string
    default = "ca-central-1a"
}

variable "sg_name" {
    type = string
    default = "webserver-sg"
}

variable "sg_description" {
    type = string
    default = "Security group for webserver"
}

variable "webserver_sg_inboundrules" {

  type = list(object({
    to_port = number
    from_port=number
    protocol=string
    description=string
    cidr_blocks = list(string)
  }))

  default = [ 
    {
        to_port = 22,
        from_port = 22,
        protocol = "tcp"
        description = "Allow SSH Port"
        cidr_blocks = ["172.31.0.0/16","192.168.0.0/16" ]
    },
    {
        to_port = 80,
        from_port = 80,
        protocol = "tcp"
        description = "Allow HTTP Port"
        cidr_blocks = ["0.0.0.0/0" ]
    }
  ]
}

variable "key_name" {
    type = string
    default = "dip_key"
}