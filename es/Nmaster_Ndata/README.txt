# Requirement

  * Each node must be able to join other by there hostname

# Configuration

  * Update **inventory** file
  * Update if needed parameters in **playbooks/group_vars/all** (optional)

# Installation

Retreiving roles :

```
ansible-galaxy install -r requirements.yml -p roles
```

Deploy stack :

```
ANSIBLE_ROLES_PATH=roles ansible-playbook -i inventory --flush-cache -D playbooks/main.yml
```

