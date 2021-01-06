Cerebro
=========

This role deploy web interface cerebro to manage elasticsearch clusters

Requirements
------------

None

Role Variables
--------------

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `cerebro_version` | 0.6.6   | Define cerebro version to install
| `cerebro_es_hosts` | ['localhost'] | Define elasticsearch hosts to connect
| `cerebro_reverse_vhost_name` | cerebro | Default apache vhost name for reverse proxy |
| `cerebro_reverse_vhost_alias` | [] | Default apache vhost alias for reverse proxy |
| `cerebro_enable_http_reverse` | True | Deploy kiabana with apache reverse proxy |

Dependencies
------------

* **apache-proxy**, when cerebro_enable_http_reverse is True

Example Playbook
----------------

### Simple

When running standalone

```yml
- hosts: all
  roles:
    - role: cerebro
```

If you install it with kibana, disable http_reverse_proxy

```yml
- hosts: all
  roles:
    - role: cerebro
      cerebro_enable_http_reverse: False # If you install it on kibana
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

* Jean-Vincent KASSI <jekas@smile.ci>
