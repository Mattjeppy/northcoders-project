variable "allocated_storage" {
    type = number
    description = "allocated storage for the database"
    default =""
}
variable "storage_type" {
    type = string
    description = "storage type for db"
    default =""
}
variable "engine" {
    type = string
    description = "SQL language"
    default =""
}
variable "engine_version" {
    type = string
    description = "version of postgreSQL"
    default =""
}
variable "instance_class" {
    type = string
    description = "db instance type"
    default =""
}
variable "name" {
    type = string
    description = "given name to database"
    default =""
}
variable "username" {
    type = string
    description = "username"
    default =""
}
variable "password" {
    type = string
    description = "password"
    default =""
}
variable "parameter_group_name" {
    type = string
    description = "parameter group name"
    default =""
}
variable "skip_final_snapshot" {
    type = bool
    description = "final snapshot"
    default =""
}