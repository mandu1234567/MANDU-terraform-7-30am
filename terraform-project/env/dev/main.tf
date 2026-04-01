module "vpc" {
  source   = "../../modules/infra"
aws_region = "us-east-1"
vpc_cidr = "10.0.0.0/16"
vpc_name = "mandu-vpc"
public_subnet_1_cidr = "10.0.1.0/24"
public_subnet_2_cidr = "10.0.2.0/24"
private_subnet_1_cidr = "10.0.3.0/24"
private_subnet_2_cidr = "10.0.4.0/24"
private_subnet_3_cidr = "10.0.5.0/24"
private_subnet_4_cidr = "10.0.6.0/24"
private_subnet_5_cidr = "10.0.7.0/24"
private_subnet_6_cidr = "10.0.8.0/24"
availability_zone_1a = "us-east-1a"
availability_zone_1b = "us-east-1b"
vpc_id            = module.vpc.vpc_id
 allowed_ssh_cidr = ["0.0.0.0/0"]   
}

module "rds" {
source         = "../../modules/database"
aws_region   = "us-east-1"
project_name = "three-tier"
identifier   = "mandu-book-rds"
allocated_storage = 20
engine            = "mysql"
engine_version    = "8.0"
instance_class    = "db.t3.micro"
multi_az          = false
db_name           = "bookdb"
db_username       = "admin"
db_password       = "mandeep123"
db_subnet_1_id    = module.vpc.private_db_subnets[0]
db_subnet_2_id    = module.vpc.private_db_subnets[1]
rds_sg_id         = module.vpc.database_sg_id

}