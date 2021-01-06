PMM Client
=========

Install PMM Client and register agent to PMM server for MariaDB and MongoDB services.

Requirements
------------
  * PMM server must be deployed and configure

  * **For MySQL** : "pmm" MySQL user must be created before deploying this role to permit pmm-server to connect to database with correct privileges. More informations are available here : https://www.percona.com/doc/percona-monitoring-and-management/conf-mysql.html


Role Variables
--------------

Variable | Default value | Description
-------- | ------------- | -----------
`use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role.

  * PMM server parameters :

Variable | Default value |Description
---------|---------------|--------------
`pmmserver_address` | 127.0.0.1 | PMM server address used to register client
`pmmserver_username` | admin | PMM server user name
`pmmserver_password` | changeme | PMM server user password

  * PMM MySQL client parameters (MySQL user must be previously created) :

Variable | Default value |Description
---------|---------------|--------------
`pmmclient_mysql_enable` | False | Deployed PMM MySQL agent on server
`pmmclient_mysql_user` | pmm | MySQL user name used by PMM to access database stats
`pmmclient_mysql_pass` | changeme | MySQL user password used by PMM to access database stats

  * PMM MongoDB client parameters (MongoDB user must be previously created) :

Variable | Default value |Description
---------|---------------|--------------
`pmmclient_mongo_enable` | False | Deployed PMM MySQL agent on server



Dependencies
------------

None.

Example Playbook
----------------

Example for MySQL agent :

```yaml
---
- hosts: mariadb
  vars:
    pmmserver_address: 192.168.122.125
    pmmserver_username: admin
    pmmserver_password: sigipsr
    pmmclient_mysql_user: pmm
    pmmclient_mysql_pass: MySecur3P@ssw0rd
  roles:
    - role: mariadb-server
      monitoring_pmm_enable: True
      monitoring_pmm_db_user: "{{ pmmclient_mysql_user }}"
      monitoring_pmm_db_pass: "{{ pmmclient_mysql_pass }}"
    - role: pmm-client
      pmmclient_mysql_enable: True
````
