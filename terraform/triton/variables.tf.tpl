variable "instance_count" {
	description = "Number of triton instances to create"
   	type = number
    default = 8
}

variable "service_name" {
	type        = string
  	description = "The name of the service in CNS."
  	default     = "somename"
}
