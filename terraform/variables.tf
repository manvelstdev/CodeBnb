variable "aws_region" {
  type = "string"
  default = "us-east-1"
  description = "The AWS region to use."
}

# App version
variable "app_version" {
  type = "string"
  description = "The version (directory) of the zip file in the s3 bucket to be used as the AWS Lambda function source; if you run `npm run deploy` this will be automatically set for you."
}

# S3 bucket name
variable "s3_bucket" {
  type = "string"
  description = "The name of the S3 bucket in which your Lambda function code will be stored. Must be globally unique. If you run `npm run deploy` this will be automatically set for you."
}

# API Gateway Stage name
variable "stage_name" {
  type = "string"
  default = "prod"
  description = "The API Gateway stage to configure."
}

# ACM + API Gateway Domain
variable "domain" {
  type = "string"
  description = "Domain name to use (should have a matching Amazon Certificate Manager certificate already in place). eg: aws.example.com."
}

# Lambda function name
variable "lambda_function_name" {
  type = "string"
  default = "CodeBnb"
  description = "The name of the Lambda function. This will be prefixed onto the domain to form your API Gateway endpoint."
}

# Lambda Environment Variables
variable "lambda_env_vars" {
  type = "string"
  default = "lambda_env_vars"
  description = "All variables beyond this are just environment variables for the AWS Lamdba function and can easily be changed later. If you're not sure just make something up and fix it later. Press [Enter] to continue."
}

variable "github_org" {
  type = "string"
  description = "The name of the organization under which software assignments will be created (and in which the template repository lives)."
}

variable "github_user_token" {
  type = "string"
  description = "An access token from https://github.com/settings/tokens retrieved by an account with sufficient permissions to the GitHub organization containing the template repo. The required permissions are *repo* ('Full control of private repositories') consisting of `repo:status`, `repo_deployment`, `public_repo`, and `repo:invite`, and *delete_repo* (to allow CodeBnb to archive the project repositories to keep the org relatively clean)."
}

variable "spreadsheet_key" {
  type = "string"
  description = "The spreadsheet key from the Google Docs URL. See https://www.npmjs.com/package/google-spreadsheet"
}

variable "google_client_email" {
  type = "string"
  description = "IAM user. See _Google Sheets Setup_ in the README. Should look like '<user>@<user>-<number>.iam.gserviceaccount.com'"
}

variable "google_private_key" {
  type = "string"
  default = "X"
  description = "IAM user private key. See _Google Sheets Setup_ in the README. This is likely too long for TF so just type 'X' and change it manually in the AWS console later. Should begin with '-----BEGIN PRIVATE KEY-----\n' and end with '\n-----END PRIVATE KEY-----\n'."
}

variable "add_candidate_authorization_code" {
  type = "string"
  description = "A randomly generated secret that needs to be provided in order to add a candidate to the list of permitted candidates. (You can make something up, but don't use anything a candidate can easily guess.)"
}

variable "archive_repo" {
  type = "string"
  default = "project-archive"
  description = "The name of the GitHub repo to use as an archive of candidate projects."
}

variable "email_from" {
  type = "string"
  description = "Your email address. Will be used as the FROM address for any emails CodeBnb sends."
}
variable "email_to" {
  type = "string"
  description = "The email address to which CodeBnb notifications (ie, archived repos) should be sent."
}




# `GITHUB_ORG` - The name of the organization under which software assignments will be created (and in which the template repository lives).
# `GITHUB_USER_TOKEN` - An access token from https://github.com/settings/tokens retrieved by an account with sufficient permissions to the GitHub organization containing the template repo. The required permissions are *repo* ("Full control of private repositories") consisting of `repo:status`, `repo_deployment`, `public_repo`, and `repo:invite`, and *delete_repo* (to allow CodeBnb to archive the project repositories to keep the org relatively clean).
#
# `SPREADSHEET_KEY` - The spreadsheet key from the Google Docs URL. See https://www.npmjs.com/package/google-spreadsheet
#
# `GOOGLE_CLIENT_EMAIL` - IAM user. See _Google Sheets Setup_ below.
#
# `GOOGLE_PRIVATE_KEY` - IAM user private key. See _Google Sheets Setup_ below.
#
# `AWS_API_GATEWAY_ENDPOINT` - The endpoint of your AWS API Gateway. Something like `https://<junk>.execute-api.us-east-1.amazonaws.com/<stage>`. See _AWS API Gateway Setup_ below.
#
# `ADD_CANDIDATE_AUTHORIZATION_CODE` - Any secret that needs to be provided in order to add a candidate to the list of permitted candidates.
