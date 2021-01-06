New Relic
=========

This role allows to install and configure the new relic apm on your server

Requirements
------------

* **None**

Role Variables
--------------

### Global variables

| Variable          | Default value      | Descriptions        |
|-------------------|-------------------|-------------------|
| newrelic_daemon_service_enabled | true  | Enable New Relic daemon service |


Dependencies
------------

* **None**

Example Playbook
----------------

```yml

- hosts: all
  roles:
    - role: newrelic-daemon

```

License
-------

BSD

Author Information
------------------

* Jean-Vincenet KASSI <jekas@smile.ci>
