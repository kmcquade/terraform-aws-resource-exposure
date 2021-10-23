resource "aws_kms_key" "example" {
  description = var.name

}
resource "aws_kms_alias" "example" {
  target_key_id = aws_kms_key.example.id
  name          = "alias/${var.name}"
}

variable "kms_grantee_principal" {
  default     = "arn:aws:iam::754728514883:root"
  description = "KMS Grants require a valid IAM principal, and I don't want to expose my own AWS Account ID, so let's give New Relic (randomly selected) access to the KMS key."
  # Well known vendor accounts taken from: https://github.com/duo-labs/cloudmapper/blob/main/vendor_accounts.yaml#L38-L40
  type = string
}

resource "null_resource" "create_kms_grant" {
  provisioner "local-exec" {
    command = "aws kms create-grant --key-id ${aws_kms_key.example.key_id} --grantee-principal '${var.kms_grantee_principal}' --operations Decrypt --operations Encrypt --operations GenerateDataKey --operations GenerateDataKeyWithoutPlaintext --operations ReEncryptFrom --operations ReEncryptTo --operations Sign --operations Verify --operations GetPublicKey --operations CreateGrant --operations RetireGrant --operations DescribeKey --operations GenerateDataKeyPair --operations GenerateDataKeyPairWithoutPlaintext --region ${var.region}"
  }
  triggers = {
    kms_key_id = aws_kms_key.example.key_id
  }
}
