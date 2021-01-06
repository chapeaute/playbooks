WSO2 IOT
=========

This role allows you to configure a wso2iot service on your system.

It mainly wraps the generic-service role to ease its use.

Requirements
------------

Host required at least 1 Go of RAM.

Role Variables
--------------

## General config

| Variable | Default value | MySQL variable |
| ---------|---------------|---------------- |
| `wso2iot_version` | 5.6.0 | Version of wso2iot to install
| `wso2iot_root_dir` | /var/lib | Installation dir of wso2 |
| `wso2iot_memory_size_prct` | 0.6 | Percentage of total memory allocated
| `wso2iot_db_host` | `{{ ansible_fqdn }}` | Mysql db host
| `wso2iot_db_user` | wso2iot | Mysql db user
| `wso2iot_db_name` | wso2iot | Mysql db name
| `wso2iot_db_pass` | **generated** | Mysql db password
| `wso2iot_admin_user` | admin | WSO2 Admin User
| `wso2iot_admin_pass` | **generated** | WSO2 Admin Password
| `wso2iot_manager_nodes` | `{{ play_hosts }}` | List of manager nodes |
| `wso2iot_worker_nodes` | [] | List of worker nodes |
| `wso2iot_remote_hostname` | `{{ ansble_hostname }}` | Remote hostname, useful if behind proxy

Dependencies
------------

* **wso2-generic**

Example Playbook
----------------

Simple playbook

```yml
- hosts: wso2iot
  roles:
    - role: mariadb-server
    - role: wso2iot
      #wso2iot_root_dir: /srv # Change installation dir
```

Cluster sample

```yml

# Deploy mariadb
- hosts: mariadb
  roles:
    - role: mariadb-server

# Deploy multiple wso2iot
# Manager nodes
- hosts: wso2iot-manager
  roles:
    - role: wso2iot
      wso2iot_db_host: mariadb
      wso2iot_manager_nodes: "{{ groups['wso2iot-manager']}}"
      wso2iot_worker_nodes: "{{ groups['wso2iot-worker']}}"

# Worker nodes
- hosts: wso2iot-worker
  roles:
    - role: wso2iot
      wso2iot_db_host: mariadb
      wso2iot_manager_nodes: "{{ groups['wso2iot-manager']}}"
      wso2iot_worker_nodes: "{{ groups['wso2iot-worker']}}"


```

Note
----

WSO2 installation can be check by browsing URL **https://serveraddress:9443/**
Default access are admin / admin.

# TODO : Add worker / manager configs
# TODO : Add cluster config


License
-------

BSD

Author Information
------------------

* emgos@smile.ci <emmanuel.gosse@smile.ci>
* jekas@smile.ci <jean.kassi@smile.ci>
