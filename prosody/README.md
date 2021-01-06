Prosody
=========

Install posody XMPP Server

Requirements
------------

* None

Role Variables
--------------

| Variable                      | Default value                                                                   | Description |
| ----------------------------- | ------------------------------------------------------------------------------- | ----------- |
`prosody_c2s_ports`               | [5222]                                                                            | Customer to service ports |
`prosody_s2s_ports`               | [5269]                                                                            | Service to service ports |
`prosody_http_ports`              | [5280]                                                                            | HTTP ports   |
`prosody_admin_users`             | []                                                                              | Admin users  |
`prosody_extra_modules`           | []                                                                              | Extra modules |
`prosody_extra_modules_enabled`   | []                                                                              | Extra modules to enable |
`prosody_extra_modules_disabled`  | []                                                                              | Extra modules to disable |
`prosody_allow_registration`      | False                                                                           | Allow registration |
`prosody_c2s_require_encryption`          | true                                                                            | Require customer to service encryption |
`prosody_s2s_require_encryption`          | true                                                                            | Require service to service encryption |
`prosody_s2s_secure_auth`                 | false                                                                           | Require service to service encryption secure auth |
`prosody_auth_provider`           | internal_hashed                                                                 | Auth provider type |
`prosody_ldap_servers`            | False                                                                           | ldap servers (if prosody_auth_provider=ldap_auth) |
`prosody_ldap_base`               | False                                                                           | ldap base  |
`prosody_ldap_filter`             | False                                                                           | ldap filter |
`prosody_ldap_starttls`           | True                                                                            | ldap start tls |
`prosody_ldap_bind_dn`            | Commented                                                                       | ldap bind domain name |
`prosody_ldap_bind_pass`          | Commented                                                                       | ldap bind password |

Dependencies
------------

* None

Example Playbook
----------------

```yml
- hosts: all
  roles:
    - role: prosody
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

* Stephen LIGUE  <stephen.ligue@smile.ci>
