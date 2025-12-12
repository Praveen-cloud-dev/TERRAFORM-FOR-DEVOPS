resource "aws_dynamodb_table" "my-dynamodb-table" {
  name           = "tf-state-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  
  tags = {
    Name        = "tf-state-table"
  }
}