Role Name
=========

A role to install and configure etcd in single node or in cluster mode.

Requirements
------------

None.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `etcd_data_dir` | /var/lib/etcd | Directory where etcd data will be stored |
| `etcd_client_port` | 2379 | Etcd client port |
| `etcd_peer_port` | 2380 | Etcd peer port (for cluster) |
| `etcd_bind_interface` | `ansible_default_ipv4.interface` | Interface Etcd bind |
| `etcd_snapshot_count` | 100 | Number of snapshot to keep |


Variables to used in cluster mode :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `etcd_hosts` | `inventory_hostname` | Cluster node list hostname |
| `etcd_cluster_name` | etcd-cluster | Name of cluster |
| `etcd_scheme` | http | Scheme to used to communicate with other node (only http supported) |
| `etcd_initial_cluster_state` | new | Etcd initial cluster state (*new* or *existing* ) |
| `etcd_election_timeout` | 30000 | Time to wait during node failure to start a new election |
| `etcd_heartbeat_interval` | 30 | Heartbeat interval between cluster node check |
| `etcd_listen_client_urls` |  |  |
| `etcd_advertise_client_urls` |  |  |
| `etcd_listen_peer_urls` |  |  |
| `etcd_initial_advertise_peer_urls` |  |  |
| `etcd_initial_cluster` |  |  |


Dependencies
------------

None.

Example Playbook
----------------

Simple example with single node :

```yaml
- hosts: etcd
  roles:
  - role: etcd
```

Simple example with a cluster :

```yaml
---
- hosts: etcd
  roles:
  - role: etcd
    etcd_hosts: "{{ play_hosts }}"
```

License
-------

BSD

Author Information
------------------

Sebastien GIRAUD : sebastien.giraud@smile.ci
