# create bastion VPC and autoscale groups
ansible-playbook --extra-vars "environ=$1" main_setup.yaml

# setup bastion machines: separate playbook requires to refresh dynamic EC2 inventory
ansible-playbook --extra-vars "environ=$1" main_config.yaml
