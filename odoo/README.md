Odoo
=========

This role allows to install and configure Odoo on server

Requirements
------------

* **Postgresql**

Role Variables
--------------

### Global variables

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `manage_firewalld` | true | Manage firewalld rules |
| `use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role. |

### Role variables

Variable              | Default value        | Description
----------------------|----------------------|------------
`odoo_version`        | 12.0                 | Odoo version to install
`odoo_port`           | 8069                 | Port used by odoo
`odoo_user`           | odoo                 | Odoo system user
`odoo_group`          | `odoo_user`          | Odoo system group
`odoo_admin_password` | **Auto generated**   | Odoo admin password
`odoo_config_custom`  | {}                   | Odoo additionnal configuration to be place un **odoo.conf** configuration file
`odoo_conf_dir`       | /etc/odoo            | Odoo configuration directory
`odoo_home_dir`       | /var/lib/odoo        | Odoo home directory
`odoo_data_dir`       | `odoo_home_dir`/data | Odoo data source directory
`odoo_log_dir`        | /var/log/odoo        | Log directory
`odoo_log_file`       | `odoo_log_dir`/odoo.log | Log file
`odoo_log_level`      | info                 | Log Level

### Tuning variables

Variable                    | Default value  | Description
----------------------------|----------------|------------
`odoo_workers`              | #vCPU          | Number of worker (1 worker = 10 users)
`odoo_max_cron_threads`     | 1              | Worker allocated to handle cron job
`odoo_limit_time_cpu`       | 600            | Prevents the worker from using more than _limit_ CPU seconds for each request. If the limit is exceeded, the worker is killed
`odoo_limit_time_real`      | 1200           | Prevents the worker from taking longer than _limit_ seconds to process a request. If the limit is exceeded, the worker is killed
`odoo_memory_prct`    | 0.8 | % of all available memory reserved for Odoo
`odoo_limit_memory_soft`    | 85% of `odoo_limit_memory_soft` | Hard limit on virtual memory, any worker exceeding the limit will be immediately killed without waiting for the end of the current request processing
`odoo_limit_memory_hard`    | (`odoo_workers` + `odoo_max_cron_threads`) x (0.8x150MB + 0.2x1024MB) x 1024x1024| Maximum allowed virtual memory per worker. If the limit is exceeded, the worker is killed and recycled at the end of the current request
`odoo_limit_memory_request` | 8192 | Number of requests a worker will process before being recycled and restarted


**Informations**: https://www.odoo.com/documentation/12.0/setup/deploy.html#builtin-server

### Database variables configuration
Variable              | Default value        | Description
----------------------|----------------------|------------
`odoo_db_driver`      | postgresql           | Odoo database driver to use (only **postgresql** is supported)
`odoo_db_host`        | 127.0.0.1            | Odoo database host
`odoo_db_port`        | 5432                 | Port used by the database
`odoo_db_user`        | odoo                 | user to use to access database
`odoo_db_pass`        | **Auto Generated**   | password to use to access database
`odoo_db_remote_host` | "{{ odoo_db_host }}" | name configured in inventory host file



Dependencies
------------

* None

Example Playbook
----------------

Simple Odoo 12 all in one installation :

```yaml
---
- hosts: odoo
  vars:
    odoo_admin_password: S3cur3P@ssW@rd#
  roles:
    - role: postgresql
      postgresql_version: 10
    - role: odoo
```


Simple Odoo 12 installation with remote PostgreSQL server :

```yaml
---
- hosts: postgresql
  roles:
    - role: postgresql
      postgresql_version: 10

- hosts: odoo
  vars:
    odoo_admin_password: S3cur3P@ssW@rd#
    odoo_db_host: "srv-postgres"
  roles:
    - role: odoo
      odoo_memory_prct: 0.8
      odoo_db_remote_host: "{{ odoo_db_host }}"
```

Complexe installation with remote PostgreSQL server :

```yaml
---
- hosts: postgresql
  vars:
    postgresql_data_dir: /srv/postgresql
  roles:
    - role: postgresql
      postgresql_version: 10

- hosts: odoo
  vars:
    odoo_version:  '12.0'
    odoo_admin_password: S3cur3P@ssW@rd#
    odoo_home_dir: /srv/odoo
    odoo_db_host: "srv-postgres"
  roles:
    - role: odoo
      odoo_db_remote_host: "{{ odoo_db_host }}"
      odoo_memory_prct: 0.8
      odoo_config_custom:
        logrotate: "true"
        log_level: "INFO"
```

Exemple to add additionnal odoo parameters with `odoo_config_custom` variables:

```yaml
odoo_config_custom:
  logrotate: "true"
  log_level: "INFO"
```


After installation, you can access Odoo application from **http://ipaddress:8069** and use **odoo_admin_password** in **Master Password** field.

License
-------

BSD

Author Information
------------------

* Sébastien GIRAUD <segir@smile.ci>
* Jean-Vincent KASSI <jekas@smile.ci>
