Mysql Provider
=========

This role provision a remote mysql database.

Requirements
------------

* None

# Description and basic usage

This role allows you to provision a remote mysql instance

## Creating databases and users

Creating databases and an user allowed to connect to it can be done by filling the mysql_databases dictionary into your inventory or into var files of your playbook :

```yml
mysql_databases:
  magento:
    db_name : magento
    collation: utf8_unicode_ci
    encoding: utf8
    user: magento
    password: changethepassword
    hosts: ['%']
  another_db:
    db_name : drupal
    collation: utf8_unicode_ci
    encoding: utf8
    user: drupal
    hosts: ['%']
    password: changethepassword
```

## Manage users only

```yml
mysql_users:
  - name: superadmin
    password: changethepassword
    priv: '*.*:ALL,GRANT'
    state: present
    hosts: ['%']
  - name: superdatabaseadmin
    password: changethepassword
    priv: 'database.*:ALL,GRANT'
    hosts: ['%']
    state: present
```

Available settings are those listed above. Note that encoding and collation are optional and their respective default values are `utf8` and `utf8_unicode_ci`.

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI (jekas@smile.ci)
