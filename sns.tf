data "aws_iam_policy_document" "sns" {
  statement {
    sid    = "__default_statement_ID"
    effect = "Allow"
    actions = [
      "SNS:GetTopicAttributes",
      "SNS:SetTopicAttributes",
      "SNS:AddPermission",
      "SNS:RemovePermission",
      "SNS:DeleteTopic",
      "SNS:Subscribe",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish",
      "SNS:Receive"
    ]
    condition {
      test     = "StringEquals"
      values   = [data.aws_caller_identity.current.account_id]
      variable = "AWS:SourceOwner"
    }
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    resources = [aws_sns_topic.example.arn]
  }
  statement {
    effect = "Allow"
    sid    = "AllowCurrentAccount"
    actions = [
      "SNS:AddPermission",
      "SNS:DeleteTopic",
      "SNS:GetTopicAttributes",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish",
      "SNS:Receive",
      "SNS:RemovePermission",
      "SNS:SetTopicAttributes",
      "SNS:Subscribe"
    ]
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    resources = [aws_sns_topic.example.arn]
  }
  statement {
    effect = "Allow"
    sid    = "AllowEveryone"
    actions = [
      "SNS:AddPermission",
      "SNS:DeleteTopic",
      "SNS:GetTopicAttributes",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish",
      "SNS:Receive",
      "SNS:RemovePermission",
      "SNS:SetTopicAttributes",
      "SNS:Subscribe"
    ]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    resources = [aws_sns_topic.example.arn]
  }
}

resource "aws_sns_topic" "example" {
  content_based_deduplication = "false"
  fifo_topic                  = "false"
  name                        = var.name
}

resource "aws_sns_topic_policy" "example" {
  arn    = aws_sns_topic.example.arn
  policy = data.aws_iam_policy_document.sns.json
}