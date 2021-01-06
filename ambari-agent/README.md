Ambari Server
=========

This role installs an Ambari Agent.

Requirements
------------

No requirements

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| ambari_version | 2.7.4.0 | Version of ambari
| ambari_root_dir | /var/lib | Install dir of ambari and hadoop services

Dependencies
------------

* **openjdk**

Examples Playbook
----------------

Simple example :

```yaml
---
- hosts: servers
  roles:
    - role: ambari-agent
      ambari_server: ambari-server
```

Testing
--------

Install molecule and docker

```bash
sudo pip2 install molecule docker
For docker just follow the official doc
https://docs.docker.com/engine/installation/#supported-platforms
```

Launch the test with this command.

```bash
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
