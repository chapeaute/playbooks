Zookeeper
=========

This role configure a zookeeper cluster

Requirements
------------

Host required at least 1 Go of RAM.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

ZooKeeper variables :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `confluent_pkg_version` | 3.1 | Confluent package version, see: https://docs.confluent.io/current/release-notes.html |
| `zk_scala_version` | 2.11.7 | Scala version |
| `zk_client_port` | 2181 | Default ZK port |
| `zk_follower_port` | 2888 | Port use for zookeeper cluster communication |
| `zk_election_port` | 3888 | Port use for zookeeper cluster communication |
| `zk_max_client_connexions` | 0 |  |
| `zk_autopurge_snapRetainCount` | 3 | Retention snapshot and log count |
| `zk_autopurge_purgeInterval` | 24 | Purge task interval execution |
| `zk_log_dir` | /var/log/zookeeper | Zookeeper log directory |
| `zk_data_dir` | /var/lib/zookeeper | Zookeeper data directory |
| `zk_tickTime` | 3000 | Number of milliseconds of each tick |
| `zk_initLimit` | 10 | Number of ticks that the initial synchronization phase can take |
| `zk_syncLimit` | 5 | Number of ticks that can pass between sending a request and getting an acknowledgement<Paste> |
| `zk_hosts` | localhost | Zookeeper cluster node |

Dependencies
------------

This role depends on:

* openjdk

Example Playbook
----------------

Simple example:

```yaml
---
- hosts: zookeeper
  roles:
    - role: zookeeper
```

Example for cluster with 3 nodes using zookeeper :

```yaml
---
- hosts: zookeeper
  roles:
    - role: zookeeper
      zk_hosts: "{{ groups['zookeeper'] }}"
```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
