#!/bin/bash

ansible-playbook --verbose --inventory-file inventory --user ec2-user --become-user root test.yml
