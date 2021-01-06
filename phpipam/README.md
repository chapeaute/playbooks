PHPIPAM
=========

This role install and configure phpipam

Requirements
------------

* mariadb-server

Role Variables
--------------

Variable | Default value |Description
---------|---------------|--------------
`phpipam_version` | 1.3 | Version of phpipam to install
`phpipam_vhost_name` | phpipam | Apache vhost name
| `phpipam_timezone`   | Africa/Abidjan | Phpipam timezone |
| `phpipam_db_host`                       | 127.0.0.1                | Database host                        |
| `phpipam_db_port`                       | 3306                     | Database port                        |
| `phpipam_db_user`                       | phpipam                   | Username used by phpipam to log on DB |
| `phpipam_db_pass`                   | `auto generated`         | Password used by phpipam to log on DB |
| `phpipam_db_name`                       | phpipam                   | Database name                        |
| `phpipam_db_remote_host`                | {{ inventory_hostname }} | Database remote host used to init phpipam DB    |

Dependencies
------------

* php
* apache
* ansistrano

Example Playbook
----------------

```yml
    - hosts: servers
      roles:
         - role: mariadb
         - role: phpipam
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