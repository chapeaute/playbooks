Beat
=========

This roles just make sure all beat use the same version

Requirements
------------

* None

Role Variables
--------------

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| elastic_version | "5.6" | Beat Major version  |
| elastic_major_version | "5" | Beat Major version  |

Dependencies
------------

* None

Example Playbook
----------------

Sample playbook

```yml
- hosts: servers
  roles:
      - role: elastic
        elastic_major_version: "6" # install elastic repo version 6

```

License
-------

BSD

Author Information
------------------

* KASSI jean-vincent <jekas@smile.ci>
