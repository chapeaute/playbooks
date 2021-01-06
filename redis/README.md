Redis
============

This role installs a Redis server

Role Variables
--------------

Variable | Default value |Description
---------|---------------|--------------
`redis_packages` | (depends on distribution) | List of packages to install
`redis_data_dir` | `/var/lib/redis` | Working directory where DB will be written
`redis_bind_address` | 0.0.0.0 | Bind address for service
`redis_bind_interface` | [] | Interface list to bind. Override `redis_bind_address` if defined
`redis_port` | 6379 | Port for service
`redis_enable_password` | false | Configure redis to use a password or not
`redis_password` | **generated** | Redis password (automaticaly added to /usr/local/sbin/redis-cli)
`redis_cmd_disabled` | ['DEBUG', 'FLUSHALL', 'FLUSHDB', 'KEYS'] | Command list to disable
`redis_setting_ulimit` | 65536 | Limit for the number of open files on the OS (ulimit -n)
`redis_setting_maxmemory_prct` | `0.8`  | Redis memory limit in percentage of memory (default: 80%)
`redis_setting_maxmemory` | `80%`  | Redis memory limit (bytes)
`redis_setting_databases` | 16 | Number of databases
Sentinel parameters :

Variable | Default value |Description
---------|---------------|--------------
`redis_hosts` | `{{ inventory_hostname }}` | Redis cluster hosts list
`redis_sentinel_hosts` | `redis_hosts` | Redis sentinel hosts list (default all node are also sentinel node)
`redis_sentinel_port` | 26379 | Redis Sentinel port
`redis_sentinel_cluster_name` | mymaster | Redis cluster name
`redis_sentinel_down_afterms` | 5000 | Time after considering a master node objectively down
`redis_sentinel_failover_timeout` | 6000 | Timeout to wait before electing a new master node to replace master node objectively down
`redis_sentinel_auth_file` | /etc/redis-auth.conf | File where store password (can be used by monitoring script to retrieve password)


Tuning parameters :

Variable | Default value |Description
---------|---------------|--------------
`redis_thp_disable` | `True` | Disable THP (Transparent Huge Pages)
`redis_setting_save` | [ "86400 1" ] | List of frequencies at which to save the redis database (see Redis doc.)
`redis_setting_appendonly` | yes | Enable append only file function to asynchronously dump data on disk.
`redis_setting_appendfsync` | everysec | How often redis call _fsync()_. Other possible values are **always** or **no**
`redis_setting_no_append_fsync_on_rewrite` | yes | Mitigate fsync blocking process problem
`redis_setting_auto_aof_rewrite_percentage` | 100 | Defined when append only file while be rewrite in percent of initial size
`redis_setting_auto_aof_rewrite_min_size` | 64mb | Minimal size of append only file before it while be rewrite
`redis_setting_maxmemory_policy` | volatile-ttl | How Redis will select what to remove when maxmemory is reached
`redis_setting_maxmemory_samples` | 10 | Sample count use during eviction

Example Playbook
----------------

Simple example :

```yaml
---
- hosts: servers
  roles:
    - role: redis
      # redis_enable_password: true # Install redis with a password
```


Cluster example with odd node and at least 3 hosts :

```yaml
---
- hosts: servers
  roles:
    - role: redis
      redis_hosts: "{{ play_hosts }}"
      # redis_enable_password: true # Install redis with a password
```

Cluster example with dedicated sentinel node :
```yaml
---
- hosts: redis
  roles:
    - role: redis
      redis_hosts: "{{ groups['redis-server'] }}"
      redis_sentinel_hosts: "{{ groups['redis-sentinel'] }}"
      # redis_enable_password: true # Install redis with a password
```

