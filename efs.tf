resource "aws_efs_file_system" "example" {
  creation_token                  = var.name
  encrypted                       = "false"
  performance_mode                = "generalPurpose"
  provisioned_throughput_in_mibps = "0"

  tags = {
    Name = var.name
  }

  tags_all = {
    Name = var.name
  }

  throughput_mode = "bursting"
}

data "aws_iam_policy_document" "efs" {
  statement {
    actions = ["elasticfilesystem:*"]
    effect  = "Allow"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    sid       = "AllowCurrentAccount"
    resources = [aws_efs_file_system.example.arn]
  }
  statement {
    actions = ["elasticfilesystem:*"]
    effect  = "Allow"
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    sid       = "Exposed"
    resources = [aws_efs_file_system.example.arn]
  }
}

resource "aws_efs_file_system_policy" "example" {
  file_system_id = aws_efs_file_system.example.id
  policy         = data.aws_iam_policy_document.efs.json
}