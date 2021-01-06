Metricbeat
=========

This module download and configure to ship the log of many service

Requirements
------------

This role requires Ansible 1.4 or higher, and platform requirements are listed in the metadata file.
You need also to have a jdk environment

Role Variables
--------------

The variables that can be passed to this role and a brief description about them are as follows:

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role. |
| `mb_version` | 7.0 | Metricbeat version |
| `mb_tags` | [] | Add tags to all events |
| `mb_extra_fields` | [] | Add an extra field to all events
| `mb_deploy_modules` | True | Deploy Metricbeat module per ansible group if available
| `mb_modules` | [] | Enable Metricbeat modules for elasticsearch version >= 6

* Logstash output plugin :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `mb_logstash_hosts` | [] | Send logs to logstash
| `mb_logstash_port` | 5044 | logstash port

* Elasticsearch output plugin :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `mb_es_hosts` | [] | Send logs to elasticsearch
| `mb_es_port` | 9200 | Elasticsearch port

* Kafka output plugin :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `mb_kafka_hosts` | [] | Send logs to kafka
| `mb_kafka_port` | 9092 | Kafka ports
| `mb_kafka_version` | "0.10.1" | Kafka servers version
| `mb_kafka_worker` | 3 | Kafka num of workers
| `mb_kafka_broker_timeout` | 6 | Kafka broker timeout
| `mb_kafka_topic` | logstash | kafka topic

Dependencies
------------

* elastic

Example Playbook
----------------

Exemple used to forward log to a Kafka cluster

```yml
- hosts: all
  roles:
    - role: metricbeat
      mb_version: "7.0"
      mb_kafka_hosts: "{{ groups['kafka'] }}"

```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
