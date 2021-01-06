Logstash
=========

This role installs a logstash server. It allows to install two versions of logstash namely  2.x and  5.x

Requirements
------------

No requirements

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `ls_version` | 5.5 | version of logstash |
| `ls_worker` | num proc | Number of worker use to handle messages in filter and output |
| `ls_batch_size` | 1000 | Bulk of messages handle|
| `ls_heap_size_prct` | (85% RAM) | Memory reserved for Logstash JVM in percent |
| `ls_heap_size` | (85% RAM) | Memory reserved for Logstash JVM |
| `ls_nice` | 19 | CPU nice for logstash process |
| `ls_path_conf` | /etc/logstash | Default configuration directory |
| `ls_path_data` | /var/lib/logstash | Default data directory |
| `ls_path_logs` | /var/log/logstash | Default log directory |
| `ls_monitoring_api_address` | 0.0.0.0 | Default bind address of logstash monitoring api |
| `ls_monitoring_api_port` | 9600 | Default bind port of logstash monitoring api
| `ls_logs_max_backup_index` | 7 | Configure he number of days you want logging to be kept.
| `ls_deploy_scripts` | True | Deploy administration scripts |
| `ls_deploy_prefilter` | True | Deploy prefilter configuration (_01-prefilter.conf_) for filebeat through kafka logging and to avoid duplicate log in elasticsearch indexes |
| `ls_deploy_sample` | False | Deploy sample configuration filter and pattern |
| `ls_uadb_update` | False | Add crontab to automatically update user agent database file |
| `firewall_setup` | True | Launch firewall task |
| `firewall_type` | "firewalld" | Open ports with firewalld |

* Kafka intput/output plugin :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `ls_conf_override` | true | Override conf if exist |
| `ls_input_kafka` | false | Add kafka input section |
| `ls_input_kafka_codec` | plain | Codec to use to read data |
| `ls_output_kafka` | false | Add kafka output section |
| `ls_output_kafka_codec` | plain | Codec to use to send data |
| `ls_kafka_topic` | logstash | default kafka topic |
| `ls_kafka_hosts` | ['localhost']  | Kafka cluster hosts list to join |
| `ls_kafka_port` | 9092 | Port used to join Kafka cluster |
| `ls_kafka_zk_port` | 2181 | ZooKeeper port to join cluster |
| `ls_kafka_max_poll_records` | 1000 | Max events logstash retrieve from kafka topic in one time |


* Elasticsearch output plugin :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `ls_output_elasticsearch` | false | Add elasticsearch output section |
| `ls_elasticsearch_hosts` | ['localhost'] | Elasticsearch cluster hosts list to join

* Filebeat input plugin :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `ls_input_beat` | false | Enable beat input plugin to receive log from filebeat agent |
| `ls_input_beat_tags` | ["beat"] | Add tags for this input

* HTTP outpout plugin

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `ls_input_http` | false | Enable http input plugin to receive log from http port |
| `ls_input_http_port` | 8080 | What port to receive event from
| `ls_input_http_tags` | ["http"] | Add tags for this input

* Syslog input plugin :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `ls_input_syslog` | false | Enable syslog input plugin to receive log from syslog agent |


| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role. |

Dependencies
------------

No dependencies

Examples Playbook
----------------

Simple example :

```yaml
---
- hosts: servers
  roles:
    - role: logstash
```

Complexe example :

```yaml
---
- hosts: logstash-shipper
  roles:
    - role: logstash
      ls_output_kafka: true
      ls_kafka_hosts: "{{ groups['kafka'] }}"

- hosts: logstash-indexer
  roles:
    - role: logstash
      ls_input_kafka: true
      ls_kafka_hosts: "{{ groups['kafka'] }}"
      ls_output_elasticsearch: true
      ls_es_hosts: ['127.0.0.1']
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

```
molecule verify # lint role
molecule check # dry run
molecule test # launch test from scracth
# You can relaunch test after with existing instances
ansible-playbook playbook
```

Docs on testing:
https://molecule.readthedocs.io

License
-------

BSD

Author Information
------------------

* Jean-Luc KOFFI <jekof@smile.ci>
* Sebastien GIREAUD <segir@smile.ci>
* Jean-Vincent KASSI <jekas@smile.ci>
