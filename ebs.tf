resource "aws_ebs_volume" "example" {
  availability_zone    = "us-east-1a"
  encrypted            = "false"
  multi_attach_enabled = "false"
  size                 = "40"
  tags = {
    Name = var.name
  }

  tags_all = {
    Name = var.name
  }
  type = "gp2"
}

resource "aws_ebs_snapshot" "example" {
  volume_id = aws_ebs_volume.example.id

  tags = {
    Name = var.name
  }
}


resource "null_resource" "share_ebs_volume_publicly" {
  provisioner "local-exec" {
    command = "aws ec2 modify-snapshot-attribute --snapshot-id ${aws_ebs_snapshot.example.id} --attribute createVolumePermission --operation-type add --group-names all --region ${var.region}"
  }
  triggers = {
    ebs_volume_id = aws_ebs_snapshot.example.id
  }
}
