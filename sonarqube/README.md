Sonarqube
=========

This role allows you to configure a sonarqube service on your system.

Requirements
------------

Host required at least 4 Go of RAM.

Role Variables
--------------

The main variable of this role is `sonarqube_version`. By default, if this variable is not specified, sonarqube version **7.6** with **OpenJDK 11** will be installed.

Variable | Default value |Description
---------|---------------|--------------
|`sonarqube_version` | 7.6 | Sonarqube version to install
| `sonarqube_memory_size_prct` | 0.7 | Percentage of total memory allocated for sonarqube |
| `sonarqube_total_memory_size_mb` | `ansible_memtotal_mb`*0.8 | Total memory to use for subprocesses. Each process will have a third of this value |
| `sonarqube_root_dir` | /var/lib | Sonarqube installation dir

Dependencies
------------

This role depends on:

* openjdk
* postgresql-provider
* apache-proxy

Example Playbook
----------------

Here is how to quickly bootstrap a new sonarqube instance:

```yaml
- hosts: all
  roles:
    - role: postgresql
    - role: sonarqube
```

Note
----

Sonarqube installation can be check by browsing URL **http://serveraddress**
The default access are: admin / admin

License
-------

BSD

Author Information
------------------

* Jean-Marc Bogninin <jean-marc.bogninin@smile.ci>
* Jean-Vincent KASSI <jean.kassi@smile.ci>