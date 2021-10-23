data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}
resource "aws_ami_copy" "example" {
  name              = var.name
  source_ami_id     = data.aws_ami.example.image_id
  source_ami_region = var.region
}

resource "null_resource" "share_ami_publicly" {
  provisioner "local-exec" {
    command = "aws ec2 modify-image-attribute --image-id ${aws_ami_copy.example.id} --launch-permission '{\"Add\":[{\"Group\":\"all\"}]}' --region ${var.region}"
  }
  triggers = {
    ami_id = aws_ami_copy.example.id
  }
}