Alfresco
=========

Deploy Alfresco

Requirements
------------

MariaDB server must be previously install on a server.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `alfresco_service` | tomcat | Service name use to manage Alfresco start/stop |
| `alfresco_version` | 201612 | Alfresco version to install |
| `alfresco_build` | "00014" | Alfresco build version to install |
| `alfresco_archive_name` | "alfresco-community-distribution-{{ alfresco_version }}" | Name of archive and directory |
| `alfresco_archive_sha256` |  |  |
| `alfresco_archive_url` |  |  |
| `alfresco_heap_size_prct` | "{{ tomcat_heap_size_prct }}" | Java memory heap sized for tomcat JVM |
| `alfresco_purge_tomcat_webapp` | ['host-manager', 'manager']  | Remove unecessary webapp install by default by tomcat |
| `alfresco_ooo_enabled` | true | Enable/Disabled OpenOffice.Org module |
| `alfresco_jodconverter_enabled` | true | Enable/Disabled Java OpenDocument converter |


Alfresco variable for database connection :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `alfresco_db_driver` | mysql | Driver used by Alfresco to access database backend |
| `alfresco_db_host` | localhost | Host used by Alfresco to access MySQL database |
| `alfresco_db_port` | 3306 | Port used by Alfresco to connect to MySQL database |
| `alfresco_db_user` | alfresco | Username used by Alfresco to access MySQL database |
| `alfresco_db_pass` | changeme | Password used by Alfresco to access MySQL database |
| `alfresco_db_name` | alfresco | MySQL database name use by Alfresco |
| `alfresco_db_remote_host` | {{ alfresco_db_host }} | Host address used by Ansible delegate\_to option to provision MySQL database (create user, database, table and user access) on a remote host |
| `alfresco_db_admin_user` | root | MySQL admin user used to connect to database localy for creation operations |
| `alfresco_db_admin_pass` | changeme | MySQL admin password to connect to database localy for creation operations |

Dependencies
------------

Use tomcat and oracle-java role.

Example Playbook
----------------

Simple example to install Alfresco and MariaDB on the same host :


```yaml
---
- hosts: all
  roles:
    - role: mariadb-server
      mysql_config_bind_address: 127.0.0.1
      mysql_config_innodb_buffer_pool_size_prct: 0.4
    - role: alfresco
      alfresco_heap_size_prct: 0.4
      alfresco_db_driver: mysql
      alfresco_db_remote_host: 192.168.122.110
```

Complete example for production used with Alfresco and MariaDB install on the same host :

```yaml
---
- hosts: alfresco
  roles:
    - role: mariadb-server
      mysql_config_bind_address: 127.0.0.1
      mysql_config_innodb_buffer_pool_size_prct: 0.4
      manage_by_cluster: true
      mysql_root_password: changeme
    - role: alfresco
      alfresco_heap_size_prct: 0.4
      alfresco_db_host: localhost
      alfresco_db_driver: mysql
      alfresco_db_remote_host: ims-ged-1
      alfresco_db_pass: changeme
      alfresco_db_admin_user: root
      alfresco_db_admin_pass: "{{ mysql_root_password }}"
```

Alfresco is now available in http://servername:8080/share/ with following credential : **admin**/**admin** and change the default password.
