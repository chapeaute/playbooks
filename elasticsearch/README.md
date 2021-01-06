ElasticSearch
=========

This role install a Elasticsearch server

Requirements
------------

Host required at least 1 Go of RAM.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `es_version` | 7.9 | ES version |
| `es_java_version` | 11 | OpenJDK version to use |
| `es_cluster_name` | default | ES cluster name |
| `es_node_name` | `ansible_fqdn` | ES node name |
| `es_network_host` | 0.0.0.0 | Interface list ES bind |
| `es_hosts` | [`es_node_name`]" | Cluster all host list |
| `es_master_hosts` | `es_hosts` | Cluster master host list |
| `es_data_hosts` | `es_hosts` | Cluster data host list |
| `es_ingest_hosts` | `es_master_hosts + es_data_hosts` | Cluster ingest host list |
| `es_master_node` | `true` if host in `es_master_hosts` | Allow this node to become master node |
| `es_data_node` | `true` if host in `es_data_hosts` | Configure this node to store data |
| `es_ingest_node` | `true` if host in `es_ingest_hosts` | Configure this node to ingest node |
| `es_shard_count` | `length(es_data_hosts)` | Number of shard per index |
| `es_replica_count` | 1 if `length(es_data_hosts)` >= 2 | Number of replica per index |
| `es_extra_config` | {} | Add extra configuration to ES (see example below)|
| `es_path_data` | /var/lib/elasticsearch | Default data directory |
| `es_path_logs` | /var/log/elasticsearch | Default log directory |
| `es_path_repo` | /var/repo/elasticsearch | Default repository directory for backup |
| `es_default_backup_dir` | /var/backup/elasticsearch | Default Backup directory |
| `es_backup_dir` | `es_default_backup_dir` | Backup dir |
| `es_install_curator` | true | Boolean for installing curator package |
| `es_install_elasticdump` | true | Boolean for installing elasticdump package |
| `es_install_admin_scripts` | true | Boolean for installing backups scripts |
| `es_install_prompt_scripts` | false | Install script for dynamic prompt |
| `firewall_setup` | True | Define if rôle open elasticsearch port, firewall_type must be defined is True |
| `firewall_type` | firewalld | Define which firewall is configured |

Elasticsearch Tuning variables :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `es_index_unassigned_node_left_delayed_timeout` | 10m | Time to wait before considering a node unavailable and reassign shard to another node in cluster |
| `es_heap_size_prct` | 0.5 | Memory reserved for Elasticsearch JVM |
| `es_heap_size` | (50% RAM) | Memory reserved for Elasticsearch JVM |
| `es_java_opts` | | Add extra java options to Elasticsearch JVM. Usefull to add proxy settings to download ES plugins. |
| `es_vm_max_map_count` | 262144 | Operating system limits on mmap counts |
| `es_max_openfiles` | 65536 | Limit for the number of open files on the OS (ulimit -n) |
| `es_index_refresh_interval` | 30s | Interval before refresh for new document to be available in search |
| `es_ping_interval` | 10s | Elasticsearch node ping interval |
| `es_ping_timeout`  | 60s | Elasticsearch ping timeout |
| `es_ping_retries`  | 3   | Elasticsearch ping retries if no response |
| `es_ignore_non_master_pings` | true | Ignore non master ping during election of master |

X-PACK Options:

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `es_xpack_enabled` | false | Enable X-PACK |
| `es_xpack_security_enabled` | false | Enable X-Pack security |
| `es_xpack_monitoring_enabled` | true | Enable X-Pack monitoring |
| `es_xpack_graph_enabled` |  false | Enable X-Pack graph module |
| `es_xpack_ml_enabled` | false | Enable X-Pack machine learning |
| `es_xpack_monitoring_history_duration` | 7d | Monitoring statistic retention period (>=1d) |

ILM (Index Lifecycle Management) configuration :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `es_ilm` | {} | Array of item to manage indices purge |
| `es_ilm.key` |  | Name of ILM (use indice prefix) |
| `es_ilm.key.hot_age` |  | Hot phase maximum age before rollover to warm phase |
| `es_ilm.key.hot_size` |  | Hot phase maximum indice size before rollover to warm phase |
| `es_ilm.key.cold_age` |  | Cold phase maximum age before rollover to delete phase |
| `es_ilm.key.delete_age` |  | Delete phase maximum age before definitely remove indice |


Purge options (deprecated, use ILM) :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `es_indice_purge` | | Array of item to manage indices purge |
| `es_indice_purge.age` | | Indices older than this number of days is purged |
| `es_indice_purge.prefix` | | Indices prefix to purge |

Plugin support change from elasticsearch version **2.x** to **5.x**. From version **5.x** plugin must be handle by an HTTP web server. Thereby **apache** webserver was automatically install if **es_plugin** is defined and elasticsearch version >= **5**.

Variables **es_plugin** is now a dictionary, see example below.

To Declare plugin in 2.x version :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `es_plugins.plugin.name` |  | Plugin name to install |

To Declare plugin in 5.x version :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `es_plugins.plugin.url` |  | Git repository of plugin to install |
| `es_plugins_path` | `/var/www/elasticsearch` | Git repository of plugin to install |

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role. |

Dependencies
------------

From elasticsearch 5.x version, plugin require used of **apache** role and **nodejs** role.

Example Playbook
----------------

Very simple example for one ElasticSearch node :

```yaml
---
- hosts: elasticsearch
  roles:
    - role: elasticsearch
```

Simple example for 3 nodes ElasticSearch cluster :

```yaml
---
- hosts: elasticsearch
  roles:
    - role: elasticsearch
      es_cluster_name: clustername
      es_hosts: [ '192.168.122.213', '192.168.122.214', '192.168.122.215' ]
```

Plugin usage for Elasticsearch 2.x (**<http://elasticsearch:9200/_plugin/kopf>**) :

```yaml
---
- hosts: elasticsearch
  roles:
    - role: elasticsearch
      es_plugins:
        kopf:
          name: "lmenezes/elasticsearch-kopf"
```

Plugin usage for Elasticsearch 5.x (**<http://elasticsearch/kopf/>**) :

```yaml
---
- hosts: elasticsearch
  roles:
    - role: elasticsearch
      es_plugins:
        kopf:
          url: http://gitlab.smile.ci/adminsys/elasticsearch-kopf.git
      es_plugins_path: /var/www/elasticsearch
      es_extra_config:
        gateway.recover_after_nodes: 3
        action.destructive_requires_name: "true"
```

Example with some usefull options :

```yaml
---
- hosts: elasticsearch
  roles:
    - role: elasticsearch
      es_plugins:
        - analysis-phonetic
        - analysis-icu
      es_extra_config:
        gateway.recover_after_nodes: 3
        action.destructive_requires_name: "true"
      es_java_opts: "-Dhttp.proxyHost=10.127.21.70 -Dhttp.proxyPort=80 -Dhttps.proxyHost=10.127.21.70 -Dhttps.proxyPort=80"
```

Complete example with N client node, M master node and X data node :

```yaml
---
- hosts: elasticsearch-all
  roles:
    - role: elasticsearch
      es_cluster_name: elasticsearch
      es_master_hosts: "{{ groups['elasticsearch-master'] }}"
      es_data_hosts: "{{ groups['elasticsearch-data'] }}"
      es_ingest_hosts: "{{ groups['elasticsearch-ingest'] }}"
      es_path_data: '/srv/elasticsearch/data'
      es_path_logs: '/srv/elasticsearch/logs'
      es_path_repo: '/srv/elasticsearch/repo'
      es_install_curator: true
      es_install_admin_scripts: true
```

Complete production example with N node :

```yaml
---
- hosts: elasticsearch-all
  roles:
    - role: elasticsearch
      es_cluster_name: es-cluster
      es_install_curator: true
      es_install_admin_scripts: true
      es_install_prompt_scripts: true
      es_hosts: "{{ groups['elasticsearch'] }}"
      es_shard_count: 6
      es_replica_count: 1
      es_path_data: "/srv/elasticsearch/data"
      es_path_logs: "/srv/elasticsearch/logs"
      es_path_repo: "/srv/elasticsearch/repo"
```

Testing
--------

Install molecule and docker

```bash
sudo pip2 install molecule docker
For docker just follow the official doc
https://docs.docker.com/engine/installation/#supported-platforms
```

Launch the test with this command.

```bash
molecule verify # lint role
molecule check # dry run
molecule test # launch test from scracth
# You can relaunch test after with existing instances
ansible-playbook playbook
```

Docs on testing:
<https://molecule.readthedocs.io>

License
-------

BSD

Author Information
------------------

* Jean-Luc KOFFI <jekof@smile.ci>
* Jean-Vincent KASSI <jekas@smile.ci>

