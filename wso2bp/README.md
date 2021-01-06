WSO2 Business Process
=========

This role install and configure WSO2 Business Process
It mainly wraps the generic-service role to ease its use.

Requirements
------------

Host required at least 1 Go of RAM.

Role Variables
--------------

| Variable | Default value | MySQL variable |
| ---------|---------------|---------------- |
| `wso2bp_version` | 6.6.0 | Version of wso2bp to install
| `wso2bp_patch_version` |  | Patch version of wso2bp
| `wso2bp_offset` | 0  | Set offset for ports
| `wso2bp_root_dir` | /var/lib | Installation root dir of wso2 |
| `wso2bp_data_root_dir` | `wso2bp_root_dir` | Installation root dir of wso2 data. Data are move to `wso2bp_root_dir`/wso2bp-data |
| `wso2bp_memory_size_prct` | 0.8 | Percentage of total memory allocated
| `wso2bp_admin_user` | admin | wso2bp Admin user |
| `wso2bp_admin_pass` | changeme | wso2bp Admin Password
| `wso2bp_db_host` | | Mysql db host
| `wso2bp_db_user` | wso2bp | Mysql db user

Dependencies
------------

* **wso2-generic**

Example Playbook
----------------

Simple playbook

```yml
- hosts: wso2bp
  roles:
    - role: wso2bp
      wso2bp_version: 6.6
      #wso2bp_root_dir: /srv # Change installation dir
```

For cluster mode, you need a remote database.

```yml

- hosts: mariadb
  roles:
    - role: mariadb-server

- hosts: wso2bp
  roles:
    - role: wso2bp
      wso2bp_db_host: mariadb
      #wso2bp_root_dir: /srv # Change installation dir
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

* jekas@smile.ci <jean.kassi@smile.ci>
