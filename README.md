# terraform-aws-resource-exposure

Terraform to demonstrate exposed resources in AWS.

> Note: Do not run this in production. Probably don't even run this in dev. Run it in a sandboxed account that you intend on nuking afterwards.

# Instructions

If you are using a non-default AWS credentials profile, then set it using these variables (one is used by AWS CLI, one is used by Terraform). In this case, I called my profile `vulnerable-aws`.

```bash
export AWS_DEFAULT_PROFILE=vulnerable-aws
export AWS_PROFILE=vulnerable-aws
```

* Now set your AWS region

```bash
export AWS_DEFAULT_REGION=us-east-1

terraform init
terraform plan
terraform apply -auto-approve
```

# Module Reference

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.0.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.63.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.2.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.63.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ami_copy.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/ami_copy) | resource |
| [aws_ebs_snapshot.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/ebs_snapshot) | resource |
| [aws_ebs_volume.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/ebs_volume) | resource |
| [aws_ecr_repository.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/ecr_repository_policy) | resource |
| [aws_efs_file_system.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/efs_file_system) | resource |
| [aws_efs_file_system_policy.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/efs_file_system_policy) | resource |
| [aws_iam_role.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/iam_role) | resource |
| [aws_iam_role.lambda_exec_role](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/iam_role) | resource |
| [aws_kms_alias.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/kms_alias) | resource |
| [aws_kms_key.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/kms_key) | resource |
| [aws_lambda_function.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/lambda_function) | resource |
| [aws_lambda_layer_version.lambda_layer](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/lambda_layer_version) | resource |
| [aws_lambda_layer_version.lambda_layer_2](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/lambda_layer_version) | resource |
| [aws_s3_bucket.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_object.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_policy.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/s3_bucket_policy) | resource |
| [aws_secretsmanager_secret.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_policy.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/secretsmanager_secret_policy) | resource |
| [aws_secretsmanager_secret_version.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/secretsmanager_secret_version) | resource |
| [aws_ses_domain_identity.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/ses_domain_identity) | resource |
| [aws_ses_identity_policy.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/ses_identity_policy) | resource |
| [aws_sns_topic.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/sns_topic_policy) | resource |
| [aws_sqs_queue.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/sqs_queue_policy) | resource |
| [null_resource.create_kms_grant](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.share_ami_publicly](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.share_ebs_volume_publicly](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.share_lambda_function_publicly](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [archive_file.layer](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_ami.example](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/ami) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.ecr](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.efs](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.iam](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ses](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sns](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sqs](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | n/a | `string` | `"test-resource-exposure.com"` | no |
| <a name="input_kms_grantee_principal"></a> [kms\_grantee\_principal](#input\_kms\_grantee\_principal) | KMS Grants require a valid IAM principal, and I don't want to expose my own AWS Account ID, so let's give New Relic (randomly selected) access to the KMS key. | `string` | `"arn:aws:iam::754728514883:root"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"test-resource-exposure"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
