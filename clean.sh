#!/bin/sh
export EC2_INI_PATH=inventory/ec2_priv.ini
ansible-playbook --extra-vars "environ=$1" clean.yaml
