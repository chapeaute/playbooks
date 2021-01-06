WSO2 Identity Server
=========

This role allows you to configure a wso2is service on your system.

It mainly wraps the generic-service role to ease its use.

Requirements
------------

Host required at least 1 Go of RAM.

Role Variables
--------------

### General config

| Variable | Default value | MySQL variable |
| ---------|---------------|---------------- |
| `wso2is_version` | 5.8.0 | Version of wso2is to install
| `wso2is_root_dir` | /var/lib | Installation root dir of wso2 |
| `wso2is_memory_size_prct` | 0.6 | Percentage of total memory allocated
| `wso2is_db_host` | | Mysql db host
| `wso2is_db_user` | wso2is | Mysql db user
| `wso2is_db_pass` | **generated** | Mysql db password
| `wso2is_admin_user` | admin | Admin User
| `wso2is_admin_pass` | changeme | WSO2 Admin Password

### Cluster configuration

Variable | Default value | MySQL variable 
---------|---------------|---------------- 
`wso2is_repl_method` | lsyncd | Replication method to used between cluster node for directory `wso2am_root_dir/wso2is-data`. Can be one of : `lsyncd`, `nfs`, `none`. If `nfs` are used, directory `wso2am_root_dir/wso2am-data` must be place on NFS storage.


### Configuration 

You can change configurations files:

* For wso2is <= 5.8.0

```yml
wso2is_deployment_conf
  carbon.xml:
    - regexp: .*(<|-)HostName>.*
      line: '<HostName>{{ wso2_generic_remote_hostname }}</HostName>'
````

* For wso2is > 5.8.0

```yml
wso2is_configs:
  carbon.xml:
    - regexp: .*(<|-)HostName>.*
      line: '<HostName>{{ wso2_generic_remote_hostname }}</HostName>'
```

Dependencies
------------

* **wso2-generic**
* **openjdk**

Example Playbook
----------------

Simple playbook

```yml
- hosts: wso2is
  roles:
    - role: wso2is
      #wso2is_root_dir: /srv # Change installation dir
```

Cluster sample, you need remote mariadb server

```yml

# Deploy mariadb
- hosts: mariadb
  roles:
    - role: mariadb-server

# Deploy multiple wso2is
- hosts: wso2is
  roles:
    - role: wso2is
      wso2is_db_host: mariadb

```

Note
----

WSO2 installation can be check by browsing URL **https://serveraddress:9443/**
Default access are admin / **generated**.

License
-------

BSD

Author Information
------------------

* emgos@smile.ci <emmanuel.gosse@smile.ci>
* jekas@smile.ci <jean.kassi@smile.ci>
