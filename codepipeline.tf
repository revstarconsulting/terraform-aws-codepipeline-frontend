resource "aws_codepipeline" "pipeline" {
  name     = "${var.project_name}-pipeline-${var.app_name}-${var.pipeline_type}"
  role_arn = var.cicd_role
  tags     = local.common_tags

  artifact_store {
    location = var.s3_artifact_store
    type     = "S3"

    encryption_key {
      id   = var.artifact_bucket_key
      type = "KMS"
    }
  }

  stage {
    name = "CodeCheckOut"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source"]

      configuration = {
        ConnectionArn        = var.codestar_connection_arn
        FullRepositoryId     = "${var.github_repo_owner}/${var.github_repo_name}"
        BranchName           = var.github_repo_branch
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }
  # Build
  stage {
    name = "Build"

    dynamic "action" {
      for_each = var.build_environments
      content {
        name     = action.key
        category = "Build"
        owner    = "AWS"
        provider = "CodeBuild"
        version  = "1"
        #Role ARN not required during build stage
        #role_arn = action.key != "dev" ? action.value["crossaccount_role"] : null
        input_artifacts  = ["source"]
        output_artifacts = ["build-${action.key}"]


        configuration = {
          ProjectName = action.value["codebuild_project"]
        }
      }
    }
  }

  # Deploy
  dynamic "stage" {
    for_each = {
      for k, v in var.deploy_environments : k => v
    }
    content {
      name = title("${stage.key}-deploy")
      dynamic "action" {
        for_each = "${stage.key}" != "dev" ? [1] : []
        content {
          name     = "${stage.key}-approval"
          category = "Approval"
          owner    = "AWS"
          provider = "Manual"
          version  = "1"

        }
      }
      action {

        name            = "cache-invalidation-${stage.key}"
        category        = "Build"
        owner           = "AWS"
        provider        = "CodeBuild"
        version         = "1"
        input_artifacts = ["source"]
        run_order       = lookup(stage.value, "run_order", "1")
        role_arn        = stage.key != "dev" ? stage.value["crossaccount_role"] : null
        configuration = {
          ProjectName = stage.value["codebuild_project"]
        }
      }
      action {
        name            = "deploy-${stage.key}"
        category        = "Deploy"
        owner           = "AWS"
        provider        = "S3"
        version         = "1"
        input_artifacts = ["build-${stage.key}"]
        run_order       = lookup(stage.value, "run_order", "2")
        role_arn        = stage.key != "dev" ? stage.value["crossaccount_role"] : null
        configuration = {
          BucketName = lookup(stage.value, "s3_deploy_bucket", var.s3_deploy_bucket)
          Extract    = "true"
        }
      }
    }
  }
}


