HADOOP
=========

This role install hadoop framework with hdfs and yarn

Requirements
------------

* None

Role Variables
--------------

### HDFS

Variable | Default value |Description
---------|---------------|--------------
| `hadoop_version`  | 2.2.2 | Spark version to install
| `hadoop_root_dir`  | /var/lib | hadoop installation dir
| `hadoop_hdfs_memory_size` | 1000 | Default to 1000 mb |
| `hadoop_slaves` | "{{ play_hosts }}" | List of hadoop slaves servers |
| `hadoop_master` | null | The fqdn of the hadoop master |
| `hadoop_hdfs_replication` | 1 | Replication of hdfs data |

### YARN

Variable | Default value |Description
---------|---------------|--------------
| `hadoop_enable_yarn` | true | Enable yarn |
| `hadoop_yarn_minimum_mb`  | 2048 | Minimum memory for container
| `hadoop_yarn_memory_size_prct` | 0.6 | Percentage of total memory allocated |
| `hadoop_yarn_maximum_mb`  | 0.63 | Spark version to install

Dependencies
------------

* openjdk
* generic-service

Example Playbook
----------------

Here is how to quickly bootstrap a new spark instance:

```yml

- hosts: all
  roles:
    - role: hadoop
      hadoop_master: CHANGEIT # fqdn of hadoop master
      hadoop_hdfs_memory_size: 1000 # dhfs heap size, this can be as low as 1000mb
      hadoop_enable_yarn: 1 # Enable yarn
      hadoop_yarn_memory_size_prct: 0.6 # Percentage of memory to use

```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
