data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "github_actions_trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${var.repository_owner}/${var.repository_name}:*"]
    }
  }
}

resource "aws_iam_openid_connect_provider" "github" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]

  lifecycle {
    precondition {
      condition     = data.aws_caller_identity.current.account_id == var.account_id
      error_message = "GitHub Actions resources must be created in the configured AWS account."
    }
  }
}

resource "aws_iam_role" "github_actions" {
  name               = "edp-github-actions-terraform-role"
  assume_role_policy = data.aws_iam_policy_document.github_actions_trust.json
  description        = "Allows the configured GitHub repository to manage Terraform state through OIDC."
}

data "aws_iam_policy_document" "github_actions_permissions" {
  statement {
    sid       = "ListTerraformStatePrefix"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${var.state_bucket_name}"]

    condition {
      test     = "StringLike"
      variable = "s3:prefix"
      values   = [var.state_key, "${var.state_key}.tflock"]
    }
  }

  statement {
    sid       = "ReadWriteTerraformState"
    effect    = "Allow"
    actions   = ["s3:GetObject", "s3:PutObject"]
    resources = ["arn:aws:s3:::${var.state_bucket_name}/${var.state_key}"]
  }

  statement {
    sid       = "ManageTerraformStateLock"
    effect    = "Allow"
    actions   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = ["arn:aws:s3:::${var.state_bucket_name}/${var.state_key}.tflock"]
  }
}

resource "aws_iam_policy" "github_actions" {
  name        = "edp-github-actions-terraform-state"
  description = "Allows access to the configured Terraform state object and S3 lock file."
  policy      = data.aws_iam_policy_document.github_actions_permissions.json
}

resource "aws_iam_role_policy_attachment" "github_actions" {
  role       = aws_iam_role.github_actions.name
  policy_arn = aws_iam_policy.github_actions.arn
}
