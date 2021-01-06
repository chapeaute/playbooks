jitsi-meet
=========

A role to install jitsi meet on a server

Requirements
------------


Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

| Variable                    | Default value                | Description                        |
| --------------------------- | ---------------------------- | ---------------------------------- |
| jitsi_meet_base_dir         | /var/lib                     | parent dir of jitsi install dir    |
| jitsi_meet_root_dir         | "{{ jitsi_base_dir }}/jitsi" | jitsi install dir                  |
| jitsi_meet_user             | meet                         | owner of install dirs              |
| jitsi_jicofo_xmpp_user      | jicofo                       | jicofo xmpp user                   |
| jitsi_stun_servers          | []                           | list of the stun servers           |
| jitsi_meet_prosody_deb_url | http://download.jitsi.org/stable/jitsi-meet-prosody_1.0.4370-1_all.deb | url of meet_prosody deb archive |
| jitsi_meet_web_deb_url | http://download.jitsi.org/stable/jitsi-meet-web_1.0.4370-1_all.deb | url of meet_web deb archive |
| jitsi_auth                  | False                        | auth type for jitsi                |
| jitsi_meet_key_path         | (see defaults)               | path to prosody key                |
| jitsi_meet_cert_path        | (see defaults)               | path to prosody cert               |
| jitsi_meet_conf_base        | (see defaults)               | conf base of meet                  |
| jitsi_meet_conf_extra       | {}                           | extra conf of meet                 |
| jitsi_meet_conf | jitsi_meet_conf_base + jitsi_meet_conf_extra | conf of meet                   |
| jitsi_meet_interface_conf_base | (see defaults)            | interface conf base of meet        |
| jitsi_meet_interface_conf_extra | {}                       | interface extra conf of meet       |
| jitsi_meet_interface_conf | jitsi_meet_interface_conf_base + jitsi_meet_interface_conf_extra | xmpp domain for videobridge |
| jitsi_meet_custom_lang      | (see defaults)         | define custom language of meet interface |
| jitsi_confmapper_port       | 8823                         | port used by confmapper            |
| jitsi_confmapper_src_ip     | []                         | ip of incoming trafic for confmapper |
| jitsi_confmapper_conf_base  | (see defaults)               | conf base of confmapper            |
| jitsi_confmapper_conf_extra | {}                           | extra conf base confmapper         |
| jitsi_confmapper_conf | jitsi_confmapper_conf_base + jitsi_confmapper_conf_extra | conf of confmapper |
| jitsi_meet_enable_etherpad  | false                        | enable etherpad usage              |
| jitsi_meet_etherpad_host | "{{ ansible_fqdn }}"         | address of the etherpad server     |
| jitsi_meet_etherpad_port    | 9001                         | listening port of the etherpad server |

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
- hosts: jitsi-meet
  vars:
    jitsi_ssl_cert_path: "/etc/ssl/{{ ansible_fqdn }}/{{ ansible_fqdn }}.pem"
    jitsi_ssl_key_path: "/etc/ssl/{{ ansible_fqdn }}/{{ ansible_fqdn }}.key"
  roles:
    - role: ssl-certs
    - role: prosody
    - role: jitsi-jicofo
    - role: jitsi-videobridge
    - role: jitsi-meet
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
