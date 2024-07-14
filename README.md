

# TERRAFORM MODULE TO CREATE VPC,EC2 #
## U NEED TO ADD a file TERRAFORM .TFVARS AS BELOW
#####         terraform.tfvars
    ADD FOLLOWING IN terraform.tfvars
    ami-value
    instance_type
    access_key
    secret_key    

################################################################
##  execute below commands

    terraform init
    terraform validate
    terraform plan
    terraform apply
