#!/bin/bash

echo "Installing software on instances:"

echo "Starting ansible..."
ansible-playbook -i ../terraform/template/hosts playbook.yml --private-key ../terraform/keys/id_rsa -v
