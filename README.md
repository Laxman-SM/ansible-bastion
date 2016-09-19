# ansible-bastion
Ansible playbook for EC2 Gaia Bastion setup.
Gaia Bastion is used to control Gaia cluster deployed on AWS.

Bastion environment is a HA cluster of similarly configured EC2 machines, accessible only through SSH.
Baction machine inventory:
- Ubuntu LTS server (currently "trusty" 14.04)

# setup environment

In order to run this playbook you need to have the following installed on your machine:
- Python 2.7.x
- pip - Python package manager
- pip modules:
  - ansible - Ansible tool
  - awscli - Amazon CLI for Python
  - boto - AWS libraries

Run following command to install required modules
```
pip install ansible awscli boto
```

You will need also to setup the following ENV variables:
```
export AWS_ACCESS_KEY_ID=A...XXX
export AWS_SECRET_ACCESS_KEY=5....XXXX
export AWS_DEFAULT_REGION='us-east-1'
export AWS_DEFAULT_AZ1='us-east-1a'
export AWS_DEFAULT_AZ2='us-east-1b'
export AWS_DEFAULT_AZ3='us-east-1d'
export AWS_DEFAULT_AZ4='us-east-1e'

```
> **Note**: protect your AWS access key and secret access key

Region needs to be set also in inventory/ec2.ini and inventory/ec2_priv.ini files

AWS credentials can also be stored in $HOME/.aws/credentials file.

`ec2.py` script is used to setup Ansible [Dynamic Inventory](http://docs.ansible.com/ansible/intro_dynamic_inventory.html) for AWS EC2.

# Ansible modules from Ansible 2.0 branch

We use additional Ansible AWS module `ec2_ami_find` from Ansible 2.0, that are not available in Ansible 1.9x.

# create new Bastion environment

The **Bastion** environment consists from dedicated VPC with several public subnets in different AWS availability zones. To configure number of subnets and Bastion cluster size, edit `group_vars/all/env.yaml` file. By default two environments are defined: **production** and **develop** (default).
To invoke Ansible playbook with different environment use the following commands:

```
./main.sh -e production|develop|custom
```

**Note**: we use 2 Ansible playbooks to discover dynamic inventory, created in first book, in second playbook.

to cleanup previously created environment, run the following code
```
clean.sh -e production|develop|custom
```
