Playbooks
=========

This project aim to gather all playbooks example which can be used to deploy quickly new applications on remote servers.

Playbooks **main.yml** can be used to include in one file many other playbooks corresponding to applications to deploy in a servers. This file is the main playbook to be used to deploy a server by including other playbooks.


Simple example to deploy basic configuration on remote host :

```yaml
---
- include: basic-server.yml
```

Complexe example to deploy LAMP plateform on a remote server :

```yaml
---
- include: basic-server.yml
- include: mariadb.yml
- include: apache.php
```

Depending of your **ansible.cfg** configuration file, you can apply your playbook with following command :

```
user$ ansible-playbook /etc/ansible/playbooks/main.yml -i yourserver.smile.lan,
```
