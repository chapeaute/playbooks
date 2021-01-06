coturn
=========

A role to install coturn on a server

Requirements
------------

* None

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

| Variable                  | Default value                        | Description                      |
| ------------------------- | ------------------------------------ | -------------------------------- |
| `coturn_server_name`        | "{{ ansible_fqdn }}"                 | fqdn of the coturn server        |
| `coturn_realm_name`         | "{{ ansible_fqdn }}"                 | realm name of the turn servers   |
| `coturn_use_certs`          | false                                 | turn on certs usage              |
| `coturn_tls_listening_port` | 4443                                 | TLS port to listen to              |
| `coturn_cert_path`          | ""                       | coturn cert path                 |
| `coturn_key_path`           | ""                        | coturn key path                |
| `coturn_listening_ip`       | 0.0.0.0                              | ip to listen to                |
| `coturn_external_ip`        | "{{ ansible_default_ipv4.address }}" | Public ip of the server       |
| `coturn_listening_port`     | 3478                                 | port to listen to              |
| `coturn_min_port`           | 10000                                | min port for forwarding range  |
| `coturn_max_port`           | 20000                                | max port for forwarding range  |
| `coturn_log_file`       |  /var/log/coturn/turnserver.log               | coturn log file path           |
| `coturn_syslog_enable`      | true                                 | enable syslog                  |
| `coturn_use_auth_secret`    | true                                 | enable secret usage            |
| `coturn_static_auth_secret` | random                               | coturn secret                  |
| `coturn_use_user`           | false                                | enable user credentials usage  |
| `coturn_user_name`          | coturn                          | user name for auth             |
| `coturn_user_password`      | random                               | user pass for auth             |

Dependencies
------------

* None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
- hosts: all
  vars:
    coturn_realm_name: "coturn.smile.ci"
  roles:
    - role: coturn
```

If you put a certificat on the server


```yml
- hosts: all
  vars:
    coturn_realm_name: "coturn.smile.ci"
    coturn_use_certs: true
    coturn_cert_path: /etc/ssl/ssl.cert
    coturn_key_path: /etc/ssl/ssl.key
  roles:
    - role: coturn

```


Testing
--------

Launch the test

```bash
pip install molecule molecule[docker]
molecule test
```

Docs on testing:
https://molecule.readthedocs.io


License
-------

BSD

Author Information
------------------

* Stephen LIGUE <stephen.ligue@smile.ci>
