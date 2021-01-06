Zimbra
=========

This role can deploy zimbra single and multi nodes

Requirements
------------

* Minimum available disk space of 5GB on /opt
* Host must have FQDN defined and reachable through it

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

| Variable                | Default value | Description |
| ----------------------  | ------------- | ----------- |
| `zimbra_domain` | example.com | Default zimbra domain |
| `zimbra_timezone`       | Africa/Abidjan | Default timezone |
| `zimbra_ldap_server`      | {{ansible_fqdn}} | Default ldap fqdn |
| `zimbra_server` | {{ansible_fqdn}} | Default zimbra_server_hostname    |
| `zimbra_password`       | changeme      |
| `zimbra_ldap_password`  | {{zimbra_password}}         | Default ldap server password |
| `zimbra_admin_password` | changeme      | Zimbra Administration password
| `zimbra_ldap_port`      | 389            | Default ldap port |
| `zimbra_services` | ['store','ldap','mta','apache','logger'] | List of zimbra services |

Dependencies
------------

None

Example Playbook
----------------

### All in One

All in one deployment for zimbra

```yml
---
- hosts: zimbra
  vars:
    zimbra_admin_password: changeme
    zimbra_timezone: "UTC"
    zimbra_ldap_server: "{{ zimbra_server }}"
    zimbra_domain: dev.smile.lan
  roles:
    - role: zimbra
      zimbra_services:
        - store
        - ldap
        - mta
        - apache
        - logger
        - drive
        - chat
        - proxy
        - memcached
        - dnscache
        - spell

```

### Multi server

Sample multi nodes playbook deployment for zimbra

```yml
---

# Two LDAP servers configured in Master/Slave architecture

- hosts: zimbra-ldap
  vars:
    zimbra_ldap_server: zimbra-ldap.dev.smile.lan
    zimbra_timezone: UTC
    zimbra_domain: dev.smile.lan
  roles:
    - role: zimbra
      zimbra_services:
        - ldap
    - role: drbd
      drbd_hosts: "{{ groups['zimbra-stack-ldap'] }}"
      drbd_disk:  /dev/mapper/vg-data
      drbd_netif:  eth1
      drbd_res_name: data
    - role: pacemaker
      pcmk_hosts: "{{ groups['zimbra-stack-ldap'] }}"
      pcmk_vip_rsc:
        - interface: eth1
          address: 192.168.8.38
          netmask: 32
      pcmk_svc_rsc:
        - zimbra
      pcmk_drbd_rsc:
        rsc_name: data
        mnt_point: /srv
        dir:
          - src_dir: /opt/zimbra
            dst_dir: /srv/zimbra

```

```yml
---
- hosts: zimbra-mta
  vars:
    zimbra_ldap_server: zimbra-ldap.dev.smile.lan
    zimbra_timezone: UTC
    zimbra_domain: dev.smile.lan
  roles:
    - role: zimbra
      zimbra_services:
        - mta
        - dnscache

```

```yml
---
- hosts: zimbra-proxy
  vars:
    zimbra_ldap_server: zimbra-ldap.dev.smile.lan
    zimbra_timezone: UTC
    zimbra_domain: dev.smile.lan
  roles:
    - role: zimbra
      zimbra_services:
        - proxy
        - memcached
```

```yml
---
- hosts: zimbra-store
  vars:
    zimbra_admin_password: changeme
    zimbra_ldap_server: zimbra-ldap.dev.smile.lan
    zimbra_timezone: UTC
    zimbra_domain: dev.smile.lan
  roles:
    - role: zimbra
      zimbra_services:
        - store
        - snmp
        - apache
        - spell
        - drive
        - chat
        - imapd

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
```

Docs on testing:
https://molecule.readthedocs.io

To launch Zimbra in a Web interface you must use the following syntax :

https://ipaddress:7071

exemple :

https://192.168.2.48:7071/

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
* Boris ASSOGBA <boass@smile.ci>
