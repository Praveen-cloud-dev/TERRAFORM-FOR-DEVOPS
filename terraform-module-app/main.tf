#dev infrastructure module
module "dev-infra" {
    source = "./infra-app"
    
    env = "dev"
    bucket_name = "infra-app-bucket1241"
    instance_count = 1
    instance_type = "t2.micro"
    ec2_ami_id = "ami-02d26659fd82cf299"
    hash_key = "studentID"
  
}
#prod infrastructure module
module "prd-infra" {
    source = "./infra-app"
    
    env = "prd"
    bucket_name = "infra-app-bucket14124"
    instance_count = 2
    instance_type = "t2.medium"
    ec2_ami_id = "ami-02d26659fd82cf299"
    hash_key = "studentID"
  
}
#staging infrastructure module
module "stg-infra" {
    source = "./infra-app"
    
    env = "stg"
    bucket_name = "infra-app-bucket1331"
    instance_count = 1
    instance_type = "t2.small"
    ec2_ami_id = "ami-02d26659fd82cf299"
    hash_key = "studentID"
  
}