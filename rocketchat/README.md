rocketchat
=========

This role install rocketchat

Requirements
------------

* **mongodb**

Role Variables
--------------

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
|`rocketchat__version` | 3.9.1 | Rocket chat version to isntall
|`rocketchat_root_dir` | /var/lib |
|`rocketchat_nodejs_version` |  12.18.4| Rocket chat version to isntall
|`rocketchat_port` | 3000 |
|`rocketchat_site_url` | "http://{{ ansible_fqdn }}" | Url to use to connect to rocketchat
|`rocketchat_db_host` | localhost | Ip of the mongodb database

Dependencies
------------

* apache-proxy
* generic-service
* nodejs

Example Playbook
----------------

Sample playbook

```yml
- hosts: all
  roles:
    - role: mongodb
    - role: rocketchat
      rocketchat_root_dir: /var/lib
      rocketchat_db_host: localhost
      rocketchat_site_url: http://chat.corp.com
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

* Narcisse KONAN <nakon@smile.ci>
* Jean-vincent KASSI <jekas@smile.ci>
