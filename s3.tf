resource "aws_s3_bucket" "example" {
  bucket = "${var.name}-${random_string.random.result}"
}

resource "aws_s3_bucket_object" "example" {
  bucket = aws_s3_bucket.example.bucket
  key    = "kinnaird-was-here.txt"
}

resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.example.bucket
  policy = data.aws_iam_policy_document.s3.json
}

data "aws_iam_policy_document" "s3" {
  statement {
    sid    = "AllowCurrentAccount"
    effect = "Allow"
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    actions = ["s3:*"]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.example.bucket}",
      "arn:aws:s3:::${aws_s3_bucket.example.bucket}/*"
    ]
  }
}

resource "random_string" "random" {
  length    = 16
  special   = false
  min_lower = 16
}