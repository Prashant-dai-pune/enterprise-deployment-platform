    ami                    = "ami-0ca9fb66e076a6e32"
    instance_type          = "t2.micro"
    vpc_security_group_ids = ["sg-04f26e9a0c99c24d2"]
    key_name               = "prashant23Dec24"
    project_name           = "project-2"
    env                    = "dev"
    unique_id              = "test-server"


    # Common Varibales
env      = "dev"
co_name  = "fqts"
vpc_id   = "vpc-043d4e27755354916"

# IAM related varibales.

master_role_name = "eks-master-role"
worker_role_name = "eks-worker-role"
policy_name = "eks-autoscale-policy"
instance_profile_name = "eks-instance-profile"


# SG related varibales
sg_name  = "eks-ssh-sg"

