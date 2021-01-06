WSO2 Application Server
=========

This role allows you to configure a wso2as service on your system.

It mainly wraps the generic-service role to ease its use.

Requirements
------------

Host required at least 1 Go of RAM.

Role Variables
--------------

The main variable of this role is `wso2as`. By default, if this variable is not specified, wso2as version **5.9.0** with **OpenJDK 8** will be installed.

Those variables are herited from `generic-service` :

Variable | Default value |Description
---------|---------------|--------------
`subpath` | Mandatory | Contains the name of the top-level directory inside the tar/zip, or the relative path in which the application is already extracted
`source_file` | None | If this parameter is given, a tar/zip file at this path will be copied and extracted to the server
`tmp_dest` | /tmp | Download temporary directory
`source_url` | None | If this parameter is given, a tar/zip file at this path will be downloaded and extracted to the server
`source_checksum` | None | The "ALG:VALUE" checksum, example : sha1:671608f9df6e44e379d78362557b8ec0659145d9
`config_directories`| None | This parameter contains configuration directories that should be copied into the wso2as instance

Additional variables you can define for this role, outside the `wso2as` one, are :
| Variable | Default value | MySQL variable |
| ---------|---------------|---------------- |
| `wso2as_root_dir` | /var/lib | Installation dir of wso2 |
| `wso2as_memory_size_prct` | 0.6 | Percentage of total memory allocated
| `wso2as_db_host` | `{{ ansible_fqdn }}` | Mysql db host
| `wso2as_db_user` | wso2as | Mysql db user
| `wso2as_db_name` | wso2as | Mysql db name
| `wso2as_db_pass` | **generated | Mysql db password

Dependencies
------------

* **openjdk**

Example Playbook
----------------

SImple playbook

```yml
- hosts: all
  roles:
    - role: mariadb-server
    - role: wso2
      #wso2as_root_dir: /srv # Change installation dir
```

Cluster sample

```yml

# Deploy mariadb
- hosts: mariadb
  roles:
    - role: mariadb-server

# Deploy multiple wso2as
- hosts: wso2as
  roles:
    - role: wso2
      wso2_db_host: mariadb

```

Note
----

WSO2 installation can be check by browsing URL **https://serveraddress:9443/**
Default access are admin / admin.


License
-------

BSD

Author Information
------------------

* jekas@smile.ci <jean.kassi@smile.ci>
