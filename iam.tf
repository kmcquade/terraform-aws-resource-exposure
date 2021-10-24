
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
resource "aws_iam_role" "example" {
  name = var.name

  assume_role_policy = data.aws_iam_policy_document.iam.json

  tags = {
    Owner = "yourmom"
  }
}
