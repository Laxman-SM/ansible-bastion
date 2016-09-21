#!/bin/sh
export EC2_INI_PATH=$(pwd)/inventory/ec2.ini
echo $EC2_INI_PATH

# read input parameters
vflag=""
while [ $# -gt 0 ]
do
  case "$1" in
    -v) vflag="-vvvv";;
    -e) e="$2"; shift;;
    -h)
        echo >&2 "usage: $0 -e environment [-v]"
        exit 1;;
     *) break;; # terminate while loop
  esac
  shift
done

# create bastion VPC and autoscale groups
# && setup bastion machines: separate playbook requires to refresh dynamic EC2 inventory
ansible-playbook --extra-vars "environ=$e" main.yaml --tags=install $vflag 
