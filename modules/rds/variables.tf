variable "allocated_storage" {
    type = number
    description = "allocated storage for the database"
    default = 20
}
variable "storage_type" {
    type = string
    description = "storage type for db"
    default = "gp2"
}
variable "engine" {
    type = string
    description = "SQL language"
    default = "postgres"
}
variable "engine_version" {
    type = string
    description = "version of postgreSQL"
    default = "13.4"
}
variable "instance_class" {
    type = string
    description = "db instance type"
    default = "db.t2.micro"
}
variable "name" {
    type = string
    description = "given name to database"
    default = "exampledb"
}
variable "username" {
    type = string
    description = "username"
    default ="username"
}
variable "password" {
    type = string
    description = "password"
    default ="password"
}
variable "parameter_group_name" {
    type = string
    description = "parameter group name"
    default = "default.postgres13"
}
variable "skip_final_snapshot" {
    type = bool
    description = "final snapshot"
    default = true
}
variable "security_group" {
    type = string
    description = "security group"

}
variable "subnet_group_name" {
    type = string
    description = "final snapshot"
  
}

