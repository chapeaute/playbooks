WSO2 EI
=========

This role allows you to configure a wso2ei service on your system.

It mainly wraps the generic-service role to ease its use.

Requirements
------------

Host required at least 1 Go of RAM.

Role Variables
--------------

| Variable | Default value | MySQL variable |
| ---------|---------------|---------------- |
| `wso2ei_version` | 6.6.0 | Version of wso2ei to install
| `wso2ei_patch_version` |  | Patch version of wso2ei
| `wso2ei_root_dir` | /var/lib | Installation root dir of wso2 |
| `wso2ei_data_root_dir` | `wso2ei_root_dir` | Installation root dir of wso2 data. Data are move to `wso2ei_root_dir`/wso2ei-data |
| `wso2ei_memory_size_prct` | 0.8 | Percentage of total memory allocated
| `wso2ei_admin_user` | admin | WSO2EI Admin user |
| `wso2ei_admin_pass` | changeme | WSO2EI Admin Password
| `wso2ei_db_host` | | Mysql db host
| `wso2ei_db_user` | wso2ei | Mysql db user

Dependencies
------------

* **wso2-generic**

Example Playbook
----------------

Simple playbook

```yml
- hosts: wso2ei
  roles:
    - role: wso2ei
      wso2ei_version: 6.6.0
      #wso2ei_root_dir: /srv # Change installation dir
```

For cluster mode, you need a remote database.

```yml

- hosts: mariadb
  roles:
    - role: mariadb-server

- hosts: wso2ei
  roles:
    - role: wso2ei
      #wso2ei_root_dir: /srv # Change installation dir
      wso2ei_version:  6.6.0
      wso2ei_db_host:  mariadb
```

Note
----

WSO2 installation can be check by browsing URL **https://serveraddress:9443/**
Default access are admin / changeme

License
-------

BSD

Author Information
------------------

* KASSI Jean-Vincent <jean.kassi@smile.ci>
