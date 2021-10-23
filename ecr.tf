
resource "aws_ecr_repository" "example" {
  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = "false"
  }

  image_tag_mutability = "MUTABLE"
  name                 = var.name
}

data "aws_iam_policy_document" "ecr" {
  statement {
    actions = ["ecr:*"]
    effect  = "Allow"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    sid = "AllowCurrentAccount"
  }
  statement {
    actions = ["ecr:*"]
    effect  = "Allow"
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    sid = "Exposed"
  }
}

resource "aws_ecr_repository_policy" "example" {
  policy     = data.aws_iam_policy_document.ecr.json
  repository = aws_ecr_repository.example.name
}