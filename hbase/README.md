HBASE
=========

This role configure and install hbase

Requirements
------------

Role Variables
--------------

The variables that can be passed to this role and a brief description about them are as follows:

| Variable | Default value | Description |
| ---------|---------------|---------------- |
| `hbase_root_dir` | /var/lib | Hbase deployment base dir |
| `hbase_memory_size_prct` | 0.6 | percantage of memory to use |
| `hbase_version` | 2.1.4 | Hbase version to use, lookup here: https://www-eu.apache.org/dist/hbase/ |


Dependencies
------------

* zookeeper

Example Playbook
----------------

Sample playbook

```yml

  - hosts: all
    roles:
       - role: hbase

```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
