Cassandra
=========

This role deploy, install and configura Cassandra in standalone or cluster mode.

Requirements
------------

None.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

Variable | Default value |Description
---------|---------------|--------------
`cassandra_version` | 311x | Cassandra version to take at https://www.apache.org/dist/cassandra/redhat/
`casandra_root_password` | **generated** | Generate password
`cassandra_bind_addr` | `{{ ansible_default_ipv4.address }}` | IP address to bind
`cassandra_bind_port` | 7199 | Port to bind
`cassandra_path_home` | /var/lib/cassandra | Default cassandra home directory path
`cassandra_path_backup` | /var/backup/cassandra | Default cassandra backup directory path
`cassandra_path_data` | `{{ cassandra_path_home }}/data` | Default data directory path
`cassandra_path_cache` | `{{ cassandra_path_home }}/saved_caches` | Default cache directory path
`cassandra_path_hints` | `{{ cassandra_path_home }}/hints` | Default hints directory path
`cassandra_path_commitlog` | `{{ cassandra_path_home }}/commitlog` | Default commit log directory path

Cluster configuration :

Variable | Default value |Description
---------|---------------|--------------
`cassandra_cluster_name` | cluster-csdr | Cluster name
`cassandra_hosts` | ['{{ cassandra_bind_addr }}'] | Cluster node list
`cassandra_enable_password` | false | Enable password authentication
`cassandra_super_user` | admin | Create super user

Tuning parameters :

Variable | Default value |Description
---------|---------------|--------------
`cassandra_num_tokens` | 256 | Token count per node
`cassandra_heap_size_prct` | 0.5 | Memory percentage reserved for Cassandra JVM
`cassandra_heap_size` | (50% RAM) | Memory reserved for Cassandra JVM (mb)
`cassandra_configuration` : {} | Key value configuration

Monitoring parameters :

Variable | Default value |Description
---------|---------------|--------------
`cassandra_jolokia_version` | 1.6.2 | Jolokia version to use
`cassandra_jolokia_port` | 8778 |  Jolokia port
`cassandra_jolokia_host` | 0.0.0.0 | Jolokia host

Other configuration :

Variable | Default value |Description
---------|---------------|--------------
`firewall_type` | firewalld | If defined configure firewalld
`cassandra_java_version` | 8 | Java version to used

Dependencies
------------

* OpenJDK

Example Playbook
----------------

Simple playbook to deploy Cassandra server :

```yaml
- hosts: cassandra
  roles:
    - role: cassandra
```

Simple playbook to deploy Cassandra cluster :

```yaml
---
- hosts: cassandra
  roles:
    - role: cassandra
      cassandra_bind_addr: "{{ ansible_eth0.ipv4.address }}"
      cassandra_cluster_name: "demo"
      cassandra_hosts: "{{ groups['cassandra'] }}"     # "{{ play_hosts }}"
```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
