Filebeat
=========

This module download and configure to ship the log of many service

Requirements
------------

This role requires Ansible 1.4 or higher, and platform requirements are listed in the metadata file.
You need also to have a jdk environment

Role Variables
--------------

The variables that can be passed to this role and a brief description about them are as follows:

Variable | Default value | Description
-------- | ------------- | -----------
`use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role.
`fb_version` | 6.0 | Filebeat version
`fb_tags` | [] | Add tags to all events
`fb_extra_fields` | [] | Add an extra field to all events
`fb_deploy_modules` | True | Deploy filebeat module per ansible group if available
`fb_modules` | [] | Enable filebeat modules if version >= 6

* Kibana variables used to setup dashboard :

Variable | Default value | Description
-------- | ------------- | -----------
`fb_kibana_host` |  | Kibana host server hostname or IP address
`fb_kibana_port` | 5601 | Kibana host server port
`fb_kibana_dashboard_prov` | false | Automatic create dashboard on kibana for filebeat agent if `true`

* Logstash output plugin :

Variable | Default value | Description
-------- | ------------- | -----------
`fb_logstash_hosts` | [] | Send logs to logstash
`fb_logstash_port` | 5044 | logstash port

* Elasticsearch output plugin :

Variable | Default value | Description
-------- | ------------- | -----------
`fb_es_hosts` | [] | Send logs to elasticsearch
`fb_es_port` | 9200 | Elasticsearch port

* Kafka output plugin :

Variable | Default value | Description
-------- | ------------- | -----------
`fb_kafka_hosts` | [] | Send logs to kafka
`fb_kafka_port` | 9092 | Kafka ports
`fb_kafka_version` | "0.10.1" | Kafka servers version
`fb_kafka_worker` | 3 | Kafka num of workers
`fb_kafka_broker_timeout` | 6 | Kafka broker timeout
`fb_kafka_topic` | logstash | kafka topic

Dependencies
------------

* elastic

Example Playbook
----------------

Exemple used to forward log to a Kafka cluster

```yml
- hosts: all
  roles:
    - role: filebeat
      fb_version: "6.0"
      fb_kafka_hosts: "{{ groups['kafka'] }}"

```

License
-------

BSD

Author Information
------------------

* Jean luc koffi (jean.koffi@smile.ci)
* Jean-Vincent KASSI <jekas@smile.ci>
