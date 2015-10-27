#!/bin/sh
export EC2_INI_PATH=inventory/ec2.ini
# read input parameters
vflag=""
while [ $# -gt 0 ]
do
  case "$1" in
    -v) vflag="-vvvv";;
    -e) env="$2"; shift;;
    -h)
        echo >&2 "usage: $0 -e environment [-v]"
        exit 1;;
     *) break;; # terminate while loop
  esac
  shift
done
# create bastion VPC and autoscale groups
# && setup bastion machines: separate playbook requires to refresh dynamic EC2 inventory
ansible-playbook --extra-vars "environ=$env" main_setup.yaml $vflag \
&& ansible-playbook --extra-vars "environ=$env" main_config.yaml $vflag
