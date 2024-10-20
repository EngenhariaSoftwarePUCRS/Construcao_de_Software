provider "aws" {
  region = "us-east-1"
  shared_credentials_files = [".aws/credentials"]
}

resource "aws_instance" "aws_lab_2_terraform_ec2" {
  ami           = "ami-0740ae8277970eb54"  # Webserver 2 Image
  instance_type = "t2.micro"
  key_name      = "aws-lab-2"
  # name          = "Webserver Terraform"
  
  security_groups = [aws_security_group.allow_http.name]

  tags = {
    Name = "aws_lab_2_terraform_ec2"
  }
}

resource "aws_dynamodb_table" "aws_lab_2_terraform_table" {
  name         = "aws-lab-1-felipefreitassilva-terraform"
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "name"
  range_key = "date"

  attribute {
    name = "name"
    type = "S"
  }

  attribute {
    name = "date"
    type = "N"
  }

  tags = {
    Name = "aws_lab_2_terraform_table"
  }
}

resource "aws_s3_bucket" "aws_lab_2_terraform_bucket" {
  bucket = "aws-lab-1-felipefreitassilva-terraform"

  tags = {
    Name = "aws_lab_2_terraform_bucket"
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_iam_role" "aws_lab_2_terraform_iam_role" {
#   name = "ec2_role"
#
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Action    = "sts:AssumeRole"
#       Effect    = "Allow"
#       Principal = {
#         Service = "ec2.amazonaws.com"
#       }
#     }]
#   })
# }
#
# resource "aws_iam_role_policy" "aws_lab_2_terraform_iam_role_policy" {
#   name = "aws_lab_2_terraform_iam_role_policy"
#   role = aws_iam_role.aws_lab_2_terraform_iam_role.id
#
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = [
#           "dynamodb:*",
#           "s3:*"
#         ]
#         Effect   = "Allow"
#         Resource = "*"
#       }
#     ]
#   })
# }
