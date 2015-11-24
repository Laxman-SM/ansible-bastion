#!/bin/sh
export EC2_INI_PATH=$(pwd)/inventory/ec2_priv.ini
echo $EC2_INI_PATH
echo $AWS_DEFAULT_REGION

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

ansible-playbook --extra-vars "environ=$e" clean_instances.yaml $vflag \
&& ansible-playbook --extra-vars "environ=$e" clean.yaml $vflag
