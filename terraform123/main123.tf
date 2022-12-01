provider "aws" {
  region = "ap-south-1"
  access_key = "AKIASBDEDVLNHJ3OSCPM"
  secret_key = "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"
}
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-s3-bucket-mallika@1987"
}