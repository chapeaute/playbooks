Memcached
=========

Install and configure Memcached.

Requirements
------------

None.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `memcached_port` | 11211 | Default memcached bind port |
| `memcached_max_conn` | 1024 | Maxmimum concurrent connection on memcached service |
| `memcached_cache_size_prct` | 0.8 | Cache size in percentage of maximum memory |
| `memcached_cache_size` | `ansible_memtotal_mb*memcached_cache_size_prct` | Cache size in MB |

Dependencies
------------

None.

Example Playbook
----------------

Simple example with Memcached install on a host with no other service :

```YAML
- hosts: all
  roles:
    - role: memcached
```

Example with multiple services installed on same hosts, reserving just a few part of memory for Memcached :

```YAML
- hosts: all
  roles:
    - role: memcached
      memcached_cache_size_prct: 0.15
```
