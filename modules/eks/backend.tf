
terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    bucket         = "love-games-eks-bucket"
    key            = "love-games-bucket/s3/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "love-games-eks-dynamo-db"
    encrypt        = true
  }
}

