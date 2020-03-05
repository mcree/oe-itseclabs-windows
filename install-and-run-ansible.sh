#!/bin/bash
set -e
set +x
cd $(dirname "$0")
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y remove python2.7-minimal
apt-get -y install python3 python3-distutils python3-pip
update-alternatives --install /usr/bin/python python /usr/bin/python3.6 10
pip3 install --ignore-installed "pywinrm>=0.2.2" "ansible==2.9.4"
ansible-playbook --inventory=ansible_inventory playbook.yml
