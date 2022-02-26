#!/bin/bash
# doctl auth init

terraform init

terraform plan


terraform apply -auto-approve

