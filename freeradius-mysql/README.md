FreeRADIUS-MySQL
=========

This role install and configure FreeRadius MySQL module backend and create user/database/access in MySQL server.

Requirements
------------

It must exist a **~/.my.cnf** user file in remote database server to allow database connection for creating radius DB.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `freerad_db.name` | default | Drive use bu FreeRADIUS to access database backend |
| `freerad_db.driver` | mysql | Drive use bu FreeRADIUS to access database backend |
| `freerad_db.host` | localhost | host used by FreeRADIUS module to access MySQL database |
| `freerad_db.port` | 3306 | port used by FreeRADIUS module to connect to MySQL database |
| `freerad_db.user` | radius | username used by FreeRADIUS module to access MySQL database |
| `freerad_db.pass` | changeme | password used by FreeRADIUS module to access MySQL database |
| `freerad_db.database` | radius | MySQL database name use by FreeRADIUS module |
| `freerad_db.remote_host` | localhost | Ansible use delegate\_to option to provision MySQL database (create user, database, table and user access) on a remote host |

Dependencies
------------

freeradius

Example Playbook
----------------

Simple example :

```yaml
---
- hosts: freeradius-server
  roles:
    - freeradius
    - role: freeradius-mysql
      freerad_db:
        - name: sql
          host: 192.168.122.52
          remote_host: 192.168.122.52
```

Complexe example :

```yaml
---
- hosts: freeradius-server
  roles:
    - role: freeradius
      freerad_enable_serverstatus: true
      freerad_server_thread_start: 32
      freerad_server_thread_max: 64
      freerad_server_thread_minspare: 10
      freerad_server_thread_maxspare: 20
    - role: freeradius-mysql
      freerad_db:
        - name: sql-ftth
          # MySQL account used to access freeradius database by SQL module
          driver: mysql
          host: freeradius-db
          port: 3306
          user: radius-ffth
          pass: jCYFWdOONlgo8RSA
          name: radius_ftth
          # MySQL admin account used to init freeradius database
          remote_host: freeradius-db
```

A user can be provision for test in `radius.radcheck` table with following SQL command :

```
INSERT INTO radcheck (username,attribute,op,value) VALUES ('foo','Cleartext-Password',':=','changeme');
```
