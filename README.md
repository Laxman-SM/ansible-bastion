# ansible-bastion
Ansible playbook for EC2 Gaia Bastion setup.
Gaia Bastion is used to control Gaia cluster deployed on AWS.

# setup environment

In order to run this playbook you need to have the following installed on your machine:
- Python 2.7.x
- pip - Python package manager
- pip modules:
  - ansible - Ansible tool
  - awscli - Amazon CLI for Python
  - boto - AWS libraries

Please, also setup the follwoing ENV variables:
- `ANSIBLE_HOSTS=/usr/local/etc/ansible/ec2.py`
- `EC2_INI_PATH=/usr/local/etc/ansible/ec2.ini`

`ec2.py` script is used to setup Ansible [Dynamic Inventory](http://docs.ansible.com/ansible/intro_dynamic_inventory.html) for AWS EC2
