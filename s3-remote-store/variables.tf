variable "bucket_name" {
    default = "love-games-bucket"
    type = string
    description = "A name for the s3 bucket"
}
variable "table_name" {
  default = "love-games-dynamo-db"
  type        = string
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
}

//--------------
variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}
//----------------

variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}