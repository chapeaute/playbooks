Elastic APM Server
=========

This role install and configure elastic apm server.

Requirements
------------

* **None**

Role Variables
--------------

The variables that can be passed to this role and a brief description about them are as follows:

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `apm_version` | "6.0" | APM Server version >= 6 |
| `apm_server_host` | 0.0.0.0 | IP address to bind to |
| `apm_server_port` |   8200  | Port to use |
| `apm_agent_version` | 1.9.0 | Apm agent version jar to download
| `apm_token` | **generated** | Apm Token to use

Ouput Kafka plugins variables :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `apm_kafka_hosts` | [] | Kafka host list |
| `apm_kafka_port` | 9092 | kafka port   |
| `apm_kafka_version` | "0.10.1" | Kafka version |
| `apm_kafka_topic` | apm | Kafka topic name to send APM metrics |
| `apm_kafka_worker` | {{ ansible\_processor\_vcpus }} | Number of workers used to send APM metrics to kafka server |

Ouput Logstash plugins variables :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `apm_logstash_port` | 5044 | logstash port   |
| `apm_logstash_hosts` | [] | Logstash host list |

Ouput Elasticsearch plugins variables :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `apm_es_hosts` | [] | ES hosts list |
| `apm_es_port`  | 9200 | ES port ||
| `apm_es_protocol` | http | APM elasticsearch protocol
| `apm_es_user` | ""  | Elasticsearch user
| `apm_es_password` | ""  | Elasticsearch password
| `apm_es_worker` | `nproc` | Number of worker to used for indexing to ES (default: number of server vCPU)
| `apm_es_queue_mem_events` | `apm_es_worker x apm_es_bulk_max_size` | Number of event to queue
| `apm_es_bulk_max_size` | 5120 | Elasticsearch bulk max size
| `apm_es_max_retries` | 3 | Elasticsearch max retries


Kibana variables settings to create dashboard :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `apm_kibana_host` |  | Kibana server address
| `apm_kibana_port` | 5601 | Kibana server port
| `apm_kibana_dashboard_setup` | false | Enable dashboard provisionning


Tuning variables :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `apm_es_worker` | `nproc` | Number of worker to used for indexing to ES (default: number of server vCPU)
| `apm_es_queue_mem_events` | `apm_es_worker x apm_es_bulk_max_size` | Number of event to queue
| `apm_es_bulk_max_size` | 5120 | Elasticsearch bulk max size
| `apm_es_max_retries` | 3 | Elasticsearch max retries

Monitoring variables :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `apm_monitoring_hosts` | `apm_es_hosts` | ES servers address where metrics will be send
| `apm_monitoring_port` | `apm_es_port` | ES servers port where metrics will be send
| `apm_monitoring_protocol` | http | Protocol to used to communicate with ES
| `apm_monitoring_user` |  | User for authentication on ES server
| `apm_monitoring_password` |  | User password for authentifcation on ES server


Dependencies
------------

* elastic

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

Exemple used to forward log to a Kafka cluster

```yml
- hosts: all
  roles:
    - role: elastic-apm
      apm_version: "6.0"
      apm_kafka_hosts: "{{ groups['kafka'] }}"

```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
