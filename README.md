## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codepipeline.pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | n/a | `string` | `""` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name | `string` | `""` | no |
| <a name="input_artifact_bucket_key"></a> [artifact\_bucket\_key](#input\_artifact\_bucket\_key) | KMS Key of artifact s3 bucket | `string` | `""` | no |
| <a name="input_build_environments"></a> [build\_environments](#input\_build\_environments) | list of environments to build ci/cd for | `any` | `[]` | no |
| <a name="input_cicd_role"></a> [cicd\_role](#input\_cicd\_role) | IAM Role to attach with CI/CD pipeline | `string` | `""` | no |
| <a name="input_codestar_connection_arn"></a> [codestar\_connection\_arn](#input\_codestar\_connection\_arn) | AWS CodeStart Connection ID | `string` | `""` | no |
| <a name="input_deploy_environments"></a> [deploy\_environments](#input\_deploy\_environments) | list of environments to build ci/cd for | `any` | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `""` | no |
| <a name="input_github_repo_branch"></a> [github\_repo\_branch](#input\_github\_repo\_branch) | Name of backend repository branch | `string` | `"main"` | no |
| <a name="input_github_repo_name"></a> [github\_repo\_name](#input\_github\_repo\_name) | Name of backend repository | `string` | `""` | no |
| <a name="input_github_repo_owner"></a> [github\_repo\_owner](#input\_github\_repo\_owner) | Owner of repository | `string` | `""` | no |
| <a name="input_pipeline_type"></a> [pipeline\_type](#input\_pipeline\_type) | Type of pipeline to be build.. e.g frotned-app, frontend-admin, eks, lambda, etc | `string` | `""` | no |
| <a name="input_production_approval"></a> [production\_approval](#input\_production\_approval) | Manual approval before prod deployment | `bool` | `true` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |
| <a name="input_s3_artifact_store"></a> [s3\_artifact\_store](#input\_s3\_artifact\_store) | Bucket where artifacts will be stored | `string` | `""` | no |
| <a name="input_s3_deploy_bucket"></a> [s3\_deploy\_bucket](#input\_s3\_deploy\_bucket) | S3 bucket for app deployment | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codepipeline_name"></a> [codepipeline\_name](#output\_codepipeline\_name) | n/a |
