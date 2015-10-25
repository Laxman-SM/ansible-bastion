#!/bin/sh
export EC2_INI_PATH=inventory/ec2.ini
# create bastion VPC and autoscale groups
# && setup bastion machines: separate playbook requires to refresh dynamic EC2 inventory
ansible-playbook --extra-vars "environ=$1" main_setup.yaml $2 \
&& ansible-playbook --extra-vars "environ=$1" main_config.yaml $2
