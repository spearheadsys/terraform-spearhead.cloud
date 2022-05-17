variable "spearhead_account" {
	description = "Spearhead Account Name"
   	type = string
}

variable "spearhead_key_id" {
	description = "Spearhead Key Id (ssh fingerprint)"
   	type = string
}

variable "spearhead_key_material" {
	description = "Spearhead Key Material (location of ssh key file)"
   	type = string
}

variable "image_name" {
	description = "Spearhead Cloud Image Name"
   	type = string
    default = "ubuntu-20.04.04"
} 

variable "image_version" {
	description = "Spearhead Cloud Image Version"
   	type = string
    default = "20220405.02"
} 

variable "number_of_kube_nodes" {
	description = "Number of kubernetes nodes"
   	type = number
    default = 3
} 
