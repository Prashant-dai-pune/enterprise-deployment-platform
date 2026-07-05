#!/bin/bash

set -e

ACTION=$1
ENV=$2

########################################
# Validate Inputs
########################################

if [[ ! "$ACTION" =~ ^(init|plan|apply|destroy)$ ]]; then
    echo "Usage: $0 {init|plan|apply|destroy} {dev|stg|prd}"
    exit 1
fi

if [[ ! "$ENV" =~ ^(dev|stg|prd)$ ]]; then
    echo "Usage: $0 {init|plan|apply|destroy} {dev|stg|prd}"
    exit 1
fi

########################################
# Common Variables
########################################

BACKEND_CONFIG="environments/${ENV}/backend.hcl"
TFVARS="environments/${ENV}/terraform.tfvars"
PLAN_FILE="tfplan"

########################################
# Banner
########################################

echo "============================================================"
echo "Terraform Action : $ACTION"
echo "Environment      : $ENV"
echo "============================================================"

########################################
# Execute Action
########################################

case "$ACTION" in

init)

    terraform fmt -recursive

    terraform init \
        -input=false \
        -backend-config="$BACKEND_CONFIG"

    terraform validate

    ;;

plan)

    terraform fmt -recursive

    terraform validate
    terraform init \
        -input=false \
        -backend-config="$BACKEND_CONFIG"

    terraform plan \
        -input=false \
        -var-file="$TFVARS"

    ;;

apply)

    terraform init \
        -input=false \
        -backend-config="$BACKEND_CONFIG"

    terraform apply \
        -input=false \
        -var-file="$TFVARS"

    ;;

destroy)

    terraform init \
        -input=false \
        -backend-config="$BACKEND_CONFIG"
        
    terraform destroy \
        -input=false \
        -var-file="$TFVARS"

    ;;

esac

echo
echo "============================================================"
echo "Completed : $ACTION"
echo "============================================================"