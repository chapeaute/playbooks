Genie ACS
----------

Deploy genieacs

Requirements
------------

None.

Role Variables
--------------

Variable | Default value |Description
---------|---------------|--------------
| `genieacs_root_dir` | /var/lib | Genieacs | data dir
| `genieacs_redis_host` | 127.0.0.1 | Redis host ip
| `genieacs_db_host` | 127.0.0.1 | Mongodb host ip
| `genieacs_db_name` | genieacs | Mongodb database name
| `genieacs_cwmp_port` | 7547 | CPEs communication | port
| `genieacs_api_port` | 7557  | Rest api Port
| `genieacs_fs_port` | 7567   | FS port
| `genieacs_ui_port` | 3000   | UI port
| `genieacs_enable_ssl`       | false                                | enable ssl usage                 |
| `genieacs_key_path`         | ""                                   | path to ssl key to use           |
| `genieacs_cert_path`        | ""                                   | path to ssl cert to use          |
| `genieacs_ca_path`          | ""                          | paths to ssl ca to use          |

Dependencies
------------

* Mongodb
* Redis
* Nodejs

Example Playbook
----------------

```yml

- hosts: all
  roles:
    - role: mongodb
    - role: redis
    - role: genieacs

```

Distributed

```yml

- hosts: genieacs-db
  roles:
    - role: mongodb
    - role: redis

- hosts: genieacs-apis
  roles:
    - role: genieacs
      genieacs_data_dir: /srv/genieacs
      genieacs_db_host: genieacs-db
      genieacs_redis_host: genieacs-db

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

```bash
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
