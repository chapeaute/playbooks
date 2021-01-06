Jicofo
=========

A role to install and configure a jicofo server.

Requirements
------------

* prosody

Role Variables
--------------

### Global variables

Those variable globally to deploy a jitsi meet platform.

| Variable                    | Default value                | Description                        |
| --------------------------- | ---------------------------- | ---------------------------------- |
| `jitsi_domain`              | "{{ ansible_fqdn }}"         | domain for jitsi                   |
| `jitsi_ssl_key_path`            | (see defaults)               | path to jitsi key for prosody      |
| `jitsi_ssl_cert_path`           | (see defaults)               | path to jitsi cert for prosody     |
| `jitsi_xmpp_server`         | "{{ ansible_fqdn }}"         | prosody server fqdn          |
| `jitsi_auth`                | False                        | Set auth type (False, sso or ldap) |
| `jitsi_stun_servers`        | []                           | list of stun servers               |
| `jitsi_turn_servers`        | []                           | list of turn servers               |
| `jitsi_turn_secret`         | p@ssw0rd                     | secret for the turn server         |
| `jitsi_turn_credentials_port` | 4443                       | credential port of the turn server |

### Jicofo variables

Thoses are jicofo specific variables.

| Variable     | Default value                | Description                        |
| -------------| ---------------------------- | ---------------------------------- |
| `jicofo_version` | 1.0-612-1 | url of jicofo deb archive |
| `jicofo_memory_size_prct`  | 0.7 | Jicofo percentage of memory to use
| `jicofo_ssl_key_path`            | /etc/prosody/certs/localhost.key              | path to use for key for prosody      |
| `jicofo_ssl_cert_path`           | /etc/prosody/certs/localhost.crt             | path to jitsi cert for prosody     |
| `jicofo_enable_health_check`  | true  | Enable jicofo healthcheck on port 8888     |

Dependencies
------------

* openjdk

Example Playbook
----------------

A script to install jitsi all in one

```yml
- hosts: jitsi-jicofo
  roles:
    - role: prosody
    - role: jitsi-jicofo
      jicofo_memory_size: 0.7
```

Testing
--------

Launch the test

```bash
pip install molecule molecule[docker]
molecule test
```

[Docs on testing](https://molecule.readthedocs.io)

License
-------

BSD

Author Information
------------------

* Stephen LIGUE <stephen.ligue@smile.ci>
* Jean-Vincent KASSI <jekas@smile.ci>
