Security
=========

Apply enforcing security recommandations on server.

Requirements
------------

None

Role Variables
--------------

Many security class of enforcement are available and for each of them a security level is defined. Security level configuration to be applied can be specified with `security_level` variable with a value from `1` to `3`.

The higher the value of `security_level` is, the stronger are security restrictions. However, be careful, some applications can not working properly with too high security level.

Dependencies
------------

None

Example Playbook
----------------

Simple example :

```yaml
---
- hosts: basic-server
  roles:
    - role: security
      security_level: 2
```

Full security Example

```yml
---
- hosts: basic-server
  roles:
    - role: security
      security_level: 3
      security_tcp_wrappers: true
      security_tcp_wrappers_allow:
        - "ALL: RESAUX_A_AUTORISER_SSH"  # ex: 192.168.2.0/23
```

