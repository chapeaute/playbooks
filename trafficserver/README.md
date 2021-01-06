trafficserver
=========

This role install and configure apache traffic server.
https://trafficserver.apache.org/

Requirements
------------

* **None**

Role Variables
--------------

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| ts_version | 8.0.5 | Apache traffic server version |
| ts_root_dir | /var/lib | Traffic server root dir |
| ts_port | 8080 | Traffic server proxy port |

Dependencies
------------

* **basic-firewalld**

Example Playbook
----------------



```yml
- hosts: all
  roles:
    - role: trafficserver
      ts_root_dir: /srv

```

Testing
--------

Launch the test

```bash
pip install molecule molecule[docker]
molecule test
```

Docs on testing:
https://molecule.readthedocs.io

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
