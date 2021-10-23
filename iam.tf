resource "aws_iam_role" "example" {
  name = var.name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Owner = "yourmom"
  }
}

data "aws_iam_policy_document" "iam" {
  statement {
    sid    = "AllowEc2"
    effect = "Allow"
    principals {
      identifiers = ["ec2.amazonaws.com"]
      type        = "Service"
    }
    actions = ["sts:AssumeRole"]
  }
  statement {
    sid    = "AllowCurrentAccount"
    effect = "Allow"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions = ["sts:AssumeRole"]
  }
  statement {
    sid     = "AllowEveryone"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
  }
}