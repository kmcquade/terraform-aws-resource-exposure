resource "aws_sqs_queue" "example" {
  name = var.name
}

resource "aws_sqs_queue_policy" "example" {
  policy    = data.aws_iam_policy_document.sqs.json
  queue_url = aws_sqs_queue.example.url
}

data "aws_iam_policy_document" "sqs" {
  statement {
    sid    = "AllowCurrentAccount"
    effect = "Allow"
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions   = ["SQS:*"]
    resources = [aws_sqs_queue.example.arn]
  }
  statement {
    sid    = "AllowEveryone"
    effect = "Allow"
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    actions   = ["SQS:*"]
    resources = [aws_sqs_queue.example.arn]
  }
}

