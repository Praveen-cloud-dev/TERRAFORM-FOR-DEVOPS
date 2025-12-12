variable "env" {    
  description = "The environment for my infra"
  type        = string
  
}

variable "bucket_name" {
    description = "The name of the S3 bucket"
    type        = string
  
}
variable "instance_count" {
    description = "this is for no instance to create"
    type        = number

  
}
variable "instance_type" {
    description = "EC2 instance type"
    type        = string
  
}
variable "ec2_ami_id" {
    description = "AMI ID for EC2 instance"
    type        = string
  
}
variable "hash_key" {
    description = "The hash key for DynamoDB table"
    type        = string
  
}