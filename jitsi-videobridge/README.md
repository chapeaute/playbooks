jitsi-videobridge
=========

A role to install videobridge on a server and register the user on the prosody server for a jitsi installation

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

### Jvb variables

| Variable                   | Default value                | Description                        |
| -------------------------- | ---------------------------- | ---------------------------------- |
| `jvb_java_version`      |    8                   | jvb java version        |
| `jvb_version`      |    1.1-126-g6df3db2-1   | Jitsi videobridge version to download [here](https://download.jitsi.org/stable)       |
| `jvb_memory_size_prct`  |    0.7                  | jvb Memory size percentage |
| `jvb_statistics_port` |  8080 | Jvb statistics port
| `jvb_statistics_interval` | 3000 | jvb statistics check interval

Dependencies
------------

* openjdk

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
- hosts: jitsi-videobridge
  vars:
  roles:
    - role: prosody
    - role: jicofo
    - role: jitsi-videobridge
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
