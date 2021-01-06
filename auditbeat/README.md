AuditBeat
=========

This module download and configure AuditBeat

Requirements
------------

This role requires Ansible 1.4 or higher, and platform requirements are listed in the metadata file.
You need also to have a jdk environment

Role Variables
--------------

The variables that can be passed to this role and a brief description about them are as follows:

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `ab_version` | 6.0 | Auditbeat version |
| `ab_tags` | [] | Add tags to all events |
| `ab_extra_fields` | [] | Add an extra field to all events
| `ab_modules` | [] | Enable Auditbeat modules for elasticsearch version >= 6
| `ab_kafka_port` | 9092 | kafka port   |
| `ab_kafka_worker` | `{{ansible_processor_vcpus}}` | The number of concurrent load-balanced Kafka output workers |
| `ab_kafka_hosts` | [] | Kafka host list |
| `ab_kafka_broker_timeout` | 6 | The maximum duration a broker will wait for number of required ACKs |
| `ab_kafka_version` | "0.10.1" | Kafka version |
| `ab_logstash_port` | 5044 | logstash port   |
| `ab_logstash_hosts` | [] | Logstash host list |
| `ab_es_hosts` | [] | Elasticsearch hosts list |
| `ab_es_port`  | 9200 | Elasticsearch port |
| `ab_es_protocol`  | http | Elasticsearch protocol |
| `ab_es_username`  | '' | Elasticsearch username |
| `ab_es_password`  | '' | Elasticsearch password |

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role. |

Dependencies
------------

* elastic

Example Playbook
----------------

Exemple used to forward log to a Kafka cluster

```yml
- hosts: all
  roles:
    - role: auditbeat
      ab_version: "7.0"
      ab_kafka_hosts: "{{ groups['kafka'] }}"

```

License
-------

BSD

Author Information
------------------

* Jean luc koffi (jean.koffi@smile.ci)
* Jean-Vincent KASSI <jekas@smile.ci>
