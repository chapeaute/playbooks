Kafka
=========

This role install a Kafka cluster with ZooKeeper

Requirements
------------

Host required at least 1 Go of RAM.

Role Variables
--------------

Kafka variables :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `kafka_scala_version` | 2.11.7 | Scala version |
| `kafka_broker_id` | 1 | ID of broker in cluster group |
| `kafka_port` | 9092 | Default port use by kafka |
| `kafka_log_dir` | /var/log/kafka | Kafka log directory |
| `kafka_data_dir` | /var/lib/kafka | Kafka data directory |
| `kafka_log_retention_hour` | 48 | Data retention in hour before deletion |
| `kafka_log_retention_disk_prct` | 0.6 | Pourcentage of total kafka data partition disk space to be used by Kafka before pruning segments |
| `kafka_log_retention_bytes` | 1073741824 | (deprecated) Data retention in byte before deletion (use `kafka_log_retention_disk_prct` instead) |
| `kafka_log_segment_bytes` | 1073741824 | Data segment in byte before rotation |
| `kafka_num_partitions` | 1 | Sharding of data |
| `kafka_default_replication_factor` | 1 | Replication factor |
| `kafka_num_network_threads` | 8 |  |
| `kafka_num_io_threads` | 8 |  |
| `kafka_socket_send_buffer_bytes` | 1048576 | Sending buffer in bytes |
| `kafka_socket_receive_buffer_bytes` | 1048576 | Receiving buffer in bytes |
| `kafka_socket_request_max_bytes` | 104857600 |  |
| `kafka_topics` | | var who can create one or more kafka topics|
| `kafka_advertised_hostname` | `ansible_fqdn` | During negociation with kafka client, kafka server send name to be used by client to communicate with him. Usefull if client access kafka server with address different to kafka server FQDN |
| `firewall_setup` | True | Launch firewall task |
| `firewall_type` | "firewalld" | Open ports with firewalld |

**Important**: In kafka cluster broker id (`kafka_broker_id`) must be different on each node ! Set variables in `inventory/host_vars/`.

Dependencies
------------

This role depend on others roles:

* zookeeper

Example Playbook
----------------

Simple example:

```yaml
---
- hosts: kafka
  roles:
    - role: kafka
```

Example for cluster with 3 nodes using zookeeper :

```yaml
---
- hosts: kafka
  roles:
    - role: kafka
      zk_hosts: "{{ groups['kafka'] }}"
      kafka_num_partitions: 3
      kafka_default_replication_factor: 2
```

Example with retention snapshot and log definition for production :

```yaml
---
- hosts:
  roles:
   - role: kafka
     kafka_log_dir: /srv/kafka/log
     zk_data_dir: /srv/zookeeper/data
     zk_hosts: "{{ groups['kafka'] }}"
     kafka_num_partitions: 64
     kafka_default_replication_factor: 3
     kafka_log_retention_disk_prct: 0.6
```


Topic creation example:

```yaml
---
- hosts: kafka
  roles:
   - role: kafka
   kafka_topics:
    test:
      zookeeper: "localhost:2181"
        replication_factor: 2
        partition: 24
```
