etherpad
=========

A role to install etherpad on a server

Requirements
------------

* **None**

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

| Variable                    | Default value                        | Description                      |
| --------------------------- | ------------------------------------ | -------------------------------- |
| `etherpad_root_dir`         | /var/lib                             | Installation dir   |
| `etherpad_log_dir`          | "{{ etherpad_base_dir }}/etherpad/log" | log dir                        |
| `etherpad_version`          | 1.8.4                                | verion to install                |
| `etherpad_listen_address`       | "{{ ansible_fqdn }}"                 | ip address of the server         |
| `etherpad_port`             | 9001                                 | port to listen to                |
| `etherpad_db_user`          | "etherpad"                             | mysql db username                |
| `etherpad_db_host`          | "{{ ansible_fqdn }}"                 | mysql host                       |
| `etherpad_db_port`          | 3306                                 | mysql port                       |
| `etherpad_db_pass`      | *generated*                          | mysql db username password       |
| `etherpad_db_name`          | "etherpad"                            | mysql db name                    |
| `etherpad_admin`            | "admin"                         | etherpad admin username          |
| `etherpad_admin_password`   | "changeme"                          | etherpad admin password          |
| `etherpad_logging_level`    | INFO                                 | etherpad logging level           |
| `etherpad_logging_console`  | false                                 | enable console logging           |
| `etherpad_logging_file`     | true                                | enable logging in a file         |
| `etherpad_logging_file_path` | "{{ etherpad_log_dir }}/etherpad.log" | path to logging file           |
| `etherpad_enable_ssl`       | false                                | enable ssl usage                 |
| `etherpad_key_path`         | ""                                   | path to ssl key to use           |
| `etherpad_cert_path`        | ""                                   | path to ssl cert to use          |
| `etherpad_ca_path`          | []                                   | paths to ssl cas to use          |

Dependencies
------------

* nodejs
* mysql-provider

Example Playbook
----------------

Install with mysql

```yml
    - hosts: etherpad
      vars:
         etherpad_db_host: "mysql.dev01.smile.lan"
         etherpad_admin_password: superpassword
      roles:
         - role: etherpad
```

Install with dirty db

```yml
    - hosts: etherpad
      roles:
         - role: etherpad
```

Testing
--------

Launch the test

```bash
pip install molecule molecule[docker]
molecule test
```

Docs on testing:
https://molecule.readthedocs.io

License
-------

BSD

Author Information
------------------

* Stephen LIGUE <stephen.ligue@smile.ci>
