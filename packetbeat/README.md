Packet Beat
=========

This role configure and install packet beat

Requirements
------------

* none

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role. |
| `pb_version` | "7.5./" | Version of packet beat to install |
| `pb_tags`    | "{{ group_names }}" | Send tags with logs |
| `pb_protocols_flows_enable` | false | Capture flow traffic
| `pb_protocols_icmp_enable` | false  |   Capture ICMP traffic


* Logstash output plugin :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `pb_logstash_hosts` | [] | Send logs to logstash
| `pb_logstash_port` | 5044 | logstash port

* Elasticsearch output plugin :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `pb_es_hosts` | [] | Send logs to elasticsearch
| `pb_es_port` | 9200 | Elasticsearch port
| `pb_es_protocol` | http | Elasticsearch protocol to use
| `pb_es_username` | 9200 | Elasticsearch username to use
| `pb_es_password` | 9200 | Elasticsearch password to use

* Kafka output plugin :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `pb_kafka_hosts` | [] | Send logs to kafka
| `pb_kafka_port` | 9092 | Kafka ports
| `pb_kafka_version` | "0.10.1" | Kafka servers version
| `pb_kafka_worker` | 3 | Kafka num of workers
| `pb_kafka_broker_timeout` | 6 | Kafka broker timeout
| `pb_kafka_topic` | logstash | kafka topic

* Monitoring config

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `pb_monitoring_enabled` | [] | Enable monitoring
| `pb_monitoring_es_hosts` | "{{ pb_es_hosts }}" | List of elasticsearch host to send monitoring info
| `pb_monitoring_http_enabled` | false | Enable http endpoint for monitoring
| `pb_monitoring_http_host` | localhost | Bind address for http monitoring
| `pb_monitoring_http_port` | 5068 | http monitoring port

* Kibana variables used to setup dashboard :

Variable | Default value | Description
-------- | ------------- | -----------
`pb_kibana_host` |  | Kibana host server hostname or IP address
`pb_kibana_port` | 5601 | Kibana host server port
`pb_kibana_dashboard_prov` | false | Automatic create dashboard on kibana for filebeat agent if `true`

Dependencies
------------

* elastic

Example Playbook
----------------

Sample playbook

```yml
    - hosts: all
      roles:
        - role: packetbeat
          pb_version: "5.6"
          pb_kafka_hosts: "{{ groups['kafka'] }}"
```

License
-------

BSD

Author Information
------------------

* Jean-Vincent kASSI <jekas@smiel.ci>
