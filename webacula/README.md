webacula
=========

This role deploy webacula.

Role Variables
--------------

| Variables            |  Default value      |  Description                          |
| ---------------------|:-------------------:| -------------------------------------:|
| `webacula_root_dir`   |  /usr/share        |  Webacula root dir    |
| `webacula_timezone`  |  Africa/Abidjan     |  Webacula timezone  |
| `webacula_db_name`   |  bacula             |  Database name                        |
| `webacula_db_user`   |  bacula             |  Database user                        |
| `webacula_db_pass`   |  `auto generated`   |  Database password                    |
| `webacula_db_host`   |  {{ ansible_fqdn }} |  Database host                        |
| `webacula_admin_pass`|  changeme           |  Webacula interface default password  |

Dependencies
------------

* mariadb-server
* bacula-director
* apache
* php

Example Playbook
----------------

```
 ---
  - hosts: serveur
    roles:
     - role: mariadb-server
     - role: bacula-director
     - role: webacula
```

Author Information
------------------

* Michel GRABA, <migra@smile.ci>
* Jean KASSI, <jekas@smile.ci>
