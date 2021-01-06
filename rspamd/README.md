RSPAMD
=========

This role install and configure rspamd server

Requirements
------------

* **redis-server**

Role Variables
--------------

|Variable | Default value |Description
|---------|---------------|--------------
| `rspamd_nodes` | {{ play_host }} | List of all the rspamd servers |
| `rspamd_password` | **generated** | Generate password to access web interface |
| `rspamd_es_hosts` | [] | List of elasticsearch host |
| `rspamd_es_port` | 9200 | Port of the elasticsearch server |
| `rspamd_redis_hosts` | ["127.0.0.1"] | List of the redis servers, if number > 1 deploy as sentinels servers |
| `rspamd_redis_port` | 6379  | Redis port |
| `rspamd_redis_password` | ''  | Redis port |
| `rspamd_redis_sentinel_port` | 26379 | Port of redis sentinel server |
| `rspamd_redis_sentinel_watch_time` | 5 | How often Rspam will query sentinels for masters and slaves. It will take x seconds for rspamd to detect new master in case of fail over |
| `rspamd_enable_http_reverse` | True  | Configure apache-proxy to access to webui |
| `rspamd_enable_http_reverse_ssl` | True  | Force access to proxy with ssl |
| `rspamd_reverse_vhost_name` | rspamd  | Apache proxy vhost name |

Dependencies
------------

* **apache-proxy**

Example Playbook
----------------

Simple all in one config

```yml
  - hosts: all
    roles:
      - role: redis
      - role: rspamd
```

Rspamd with redis sentinel

```yml
  - hosts: redis
    roles:
      - role: redis

  - hosts: rspamd
    roles:
      - role: rspamd
        rspamd_hosts: "{{ groups'[rspamd'] }}"
        rspamd_redis_hosts: "{{ groups['redis'] }}"
```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
