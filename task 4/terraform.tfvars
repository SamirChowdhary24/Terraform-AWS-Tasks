
vpc_cidr="10.0.0.0/16"
az_count      = 2
db_pass       = "BigData123" #not the actual pass
availability_zones = ["us-west-1c", "us-west-1b"]
key_name      = "newkey"
instance_type = "t2.micro"
ami_id        = "ami-07706bb32254a7fe5"
user_data     = ""
tags = {
  Project     = "SamBoxxerTask4"
}
