WSO2 Application Manager
=========

This role allows you to configure a wso2am service on your system.

It mainly wraps the generic-service role to ease its use.

Requirements
------------

Host required at least 1 Go of RAM.

Role Variables
--------------

## General config

| Variable | Default value | MySQL variable |
| ---------|---------------|---------------- |
| `wso2am_version` | 2.6.0 | Version of wso2am to install
| `wso2am_offset` | -  | Version of wso2am to install
| `wso2am_apictl_url` | (see default) | Url to api controller archive
| `wso2am_root_dir` | /var/lib | Installation dir of wso2 |
| `wso2am_memory_size_prct` | 0.6 | Percentage of total memory allocated
| `wso2am_db_host` | `{{ inventory_hostname }}` | Mysql db host
| `wso2am_db_user` | wso2am | Mysql db user
| `wso2am_db_name` | wso2am | Mysql db name
| `wso2am_db_pass` | **generated** | Mysql db password
| `wso2am_admin_user` | admin | WSO2 Admin User
| `wso2am_admin_pass` | **generated** | WSO2 Admin Password
| `wso2am_manager_nodes` | `{{ play_hosts }}` | List of manager nodes |
| `wso2am_worker_nodes` | [] | List of worker nodes |
| `wso2am_remote_hostname` | `{{ ansble_hostname }}` | Remote hostname, useful if behind proxy

Dependencies
------------

* **wso2-generic**

Example Playbook
----------------

Simple playbook

```yml
- hosts: wso2am
  roles:
    - role: wso2am
      #wso2am_root_dir: /srv # Change installation dir
```

Cluster sample

```yml

# Deploy mariadb
- hosts: mariadb
  roles:
    - role: mariadb-server

# Deploy multiple wso2am
# Manager nodes
- hosts: wso2am-manager
  roles:
    - role: wso2am
      wso2am_db_host: mariadb
      wso2am_manager_nodes: "{{ groups['wso2am-manager']}}"
      wso2am_worker_nodes: "{{ groups['wso2am-worker']}}"

# Worker nodes
- hosts: wso2am-worker
  roles:
    - role: wso2am
      wso2am_db_host: mariadb
      wso2am_manager_nodes: "{{ groups['wso2am-manager']}}"
      wso2am_worker_nodes: "{{ groups['wso2am-worker']}}"


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

* emgos@smile.ci <emmanuel.gosse@smile.ci>
* jekas@smile.ci <jean.kassi@smile.ci>
