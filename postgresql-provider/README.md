PostgreSQL Provider
=========

This role provision users and databases in a remote postgresql database.

Requirements
------------

* None

Description and basic usage
--------------

Creating databases and users

Creating databases and an user allowed to connect to it can be done by filling the postgresql_databases dictionary into your inventory or into var files of your playbook :

```yml
postgresql_databases:
  magento:
    db_name : magento
    encoding: utf8
    user: magento
    password: changethepassword
  another_db:
    db_name : drupal
    encoding: utf8
    user: drupal
    password: changethepassword
```

Manage users only
-----------

```yml
postgresql_users:
  - name: superadmin
    password: changethepassword
    priv: ALL'
    roles: CREATEDB,CREATEROLE,SUPERUSER
    state: present
  - name: superdatabaseadmin
    password: changethepassword
    priv: ALL/table:ALL
    state: present
```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@simle.ci>
