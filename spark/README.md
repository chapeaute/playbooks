Spark
======

This role allows you to configure a spark service on your system.
It mainly wraps the generic-service role to ease its use.

Requirements
------------

Host required at least 1 Go of RAM.

Role Variables
--------------

### Gloval vars

Variable | Default value |Description
---------|---------------|--------------
| `jolokia_port`  | 8778 | Jolokia port
| `jolokia_version` | 1.6.2 | jolokia jar version

### Local vars

Variable | Default value |Description
---------|---------------|--------------
| `spark_version`  | 2.4.0 | Spark version to install
| `spark_hadoop_version` | 2.7 | Spark hadoop verison
| `spark_root_dir`  | /var/lib | spark installation dir
| `spark_masters` | [`{{ ansible_fqdn }}`] | The fqdn of the spark masters |
| `spark_master_port` | 8081 | Spark MasterWEB UI port  |
| `spark_worker_port` | 8082 | Spark Worker WEB UI port  |
| `spark_zk_hosts` | "{{ spark_masters }}" | List of zookeeper nodes |
| `spark_zk_port` | 2181 | Default zookeeper port |
| `spark_zk_dir` |  /spark | Dfault zookeeper dir  |

Dependencies
------------

This role depends on:

* openjdk
* scala
* generic-service

Example Playbook
----------------

Here is how to quickly bootstrap a new standalone spark instance:

```yaml
- hosts: all
  roles:
    - role: spark
      spark_root_dir: "/srv"
      spark_version: 2.4.0

```

Here is how to quickly bootstrap a new spark cluster with 3+ nodes

```yaml
- hosts: all
  roles:
    - role: zookeeper
      zk_hosts: "{{ play_hosts }}"
      zk_data_dir: "/srv/zookeeper"
    - role: spark
      spark_root_dir: "/srv"
      spark_version: 2.4.0

```

How to use
----------

Users that need to launch spark command can do

```bash
sudo su - spark
```

Spark Master can be acccess with http://MASTER_ADDRESS:8081.
In case, you have more than 1 master node, the active master is elected by zookeeper.

License
-------

BSD

Author Information
------------------

* Jean-Luc KOFFI <jekof@smile.ci>
* Jean-Vincent KASSI <jekas@smile.ci>
