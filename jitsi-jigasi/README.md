Jigasi
=========

A role to install jigasi on a server and register the user on the prosody server for a jitsi installation

Requirements
------------

* prosody
* jicofo

Role Variables
--------------

### Global variables

Those variable globally to deploy a jitsi meet platform.

| Variable                    | Default value                | Description                        |
| --------------------------- | ---------------------------- | ---------------------------------- |
| `jitsi_xmpp_domain`              | "{{ ansible_fqdn }}"         | domain for jitsi                   |
| `jitsi_xmpp_server`         | "{{ ansible_fqdn }}"         | prosody server fqdn          |
| `jitsi_auth`                | False                        | Set auth type (False, sso or ldap) |

### Jigasi variables

| Variable                   | Default value                | Description                        |
| -------------------------- | ---------------------------- | ---------------------------------- |
| `jigasi_java_version`      |    8                   | jigasi java version        |
| `jigasi_version`      |    1.1-126-g6df3db2-1                    | jigasi sip user        |
| `jigasi_memory_size_prct`  |    0.7                  | jigasi Memory size percentage |
| `jigasi_sip_user`      |  ""                 | jigasi sip user                    |
| `jigasi_sip_secret`    | jigasi                       | secret for the jigasi component    |
| `jigasi_sip_server`    | "{{ ansible_fqdn }}"         | fqdn of the jigasi server          |
| `jigasi_sip_port`      | 5060                         | port for sip communications        |

Dependencies
------------

* openjdk

Example Playbook
----------------

```yml
- hosts: jitsi-jigasi
  roles:
    - role: prosody
    - role: jitsi-jicofo
    - role: jitsi-jigasi
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
