PhpMyAdmin
=========

This role install and configure phpmyadmin

Requirements
------------

None

Role Variables
--------------


| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `phpmyadmin_aliases` | ['phpMyAdmin', 'phpmyadmin'] | PhpMyAdmin aliases to acess the application
| `phpmyadmin_allowed_ips` | ["{{ ansible_default_ipv4.network }}/{{ ansible_default_ipv4.netmask }}"] | Allowed ips to connect to phpmyadmin

Dependencies
------------

* **apache**

Example Playbook
----------------

Simple installation

```yml
- hosts: servers
  roles:
    - role: phpmyadmin
```

Define phpmyadmin and aliases

```yml
- hosts: servers
  roles:
    - role: phpmyadmin
      phpmyadmin_aliases: ['/dbmanager']
      phpmyadmin_allowed_ips: ['172.18.0.0/24']
```

Testing
--------

Install molecule and docker

```bash
sudo pip2 install molecule docker
For docker just follow the official doc
https://docs.docker.com/engine/installation/#supported-platforms
```

Launch the test with this command.

```
molecule verify # lint role
molecule check # dry run
molecule test # launch test from scracth
# You can relaunch test after with existing instances
ansible-playbook playbook
```

Docs on testing:
https://molecule.readthedocs.io

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>