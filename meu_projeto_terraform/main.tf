provider "aws" {
    region = "us-east-1"
    shared_credentials_files = [".aws/credentials"]
}

resource "aws_instance" "example" {
    ami           = "ami-007855ac798b5175e" # Ubuntu 22.04 LTS
    instance_type = "t2.micro"

    tags = {
        Name = "example-instance"
    }
}
