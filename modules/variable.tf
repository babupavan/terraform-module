variable "ami-value" {
   description = "this is my ami value"
}

variable "instance_type" {
    description = "this instance is t2.micro"  
}

variable "access_key" {
  description = "this is my access-key"  
}

variable "secret_key" {
    description = "this is my secret-key"
}

variable "example" {
    description = "to create multiple variables"
    default =   {
        region = "ap-south-1"
        key_name = "myNEWkeypair"
    }
}