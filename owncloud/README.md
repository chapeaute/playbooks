OwnCloud
=========

This role deploy ownclou.

Role Variables
--------------

| Variables            |  Default value      |  Description                          |
| ---------------------|:-------------------:| -------------------------------------:|
| `owncloud_root_dir`  |  /var/www           |  OwnCloud root dir                    |
| `owncloud_timezone`  |  Africa/Abidjan     |  Owncloud timezone                    |
| `owncloud_db_name`   |  owncloud           |  Database name                        |
| `owncloud_db_user`   |  owncloud           |  Database user                        |
| `owncloud_db_pass`   |  `auto generated`   |  Database password                    |
| `owncloud_db_host`   |  {{ ansible_fqdn }} |  Database host                        |
| `owncloud_admin_pass`|  changeme           |  Owncloud interface default password  |

Dependencies
------------

* apache
* php

Example Playbook
----------------

```yml
 ---
  - hosts: serveur
    vars:
      # owncloud_docroot_dir: /srv/www
    roles:
      - role: mariadb-server
      - role: bacula-director
      - role: owncloud
```

Author Information
------------------

* Jean KASSI, <jekas@smile.ci>
