resource "aws_ses_domain_identity" "example" {
  domain = var.domain_name
}

data "aws_iam_policy_document" "ses" {
  statement {
    actions   = ["ses:*"]
    resources = [aws_ses_domain_identity.example.arn]

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
  }
}

resource "aws_ses_identity_policy" "example" {
  identity = aws_ses_domain_identity.example.arn
  name     = var.name
  policy   = data.aws_iam_policy_document.ses.json
}