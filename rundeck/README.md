Rundeck
=========

Deploy rundeck.

Requirements
------------

None.

Role Variables
--------------

Variable | Default value |Description
---------|---------------|--------------
`rundeck_admin_pass` | changeme | Default admin passowrd used to log on interface
`rundeck_port` | 4440 | Default port used by rundeck
`rundeck_ansible_enable` | `True` | Install ansible if node will be receive from Ansible inventory
 `use_satellite_repo` | False | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role.
`rundeck_apache_proxy_enable` | False | If set to True, install apache in reverse proxy in front of rundeck
`rundeck_apache_vhostname` | `ansible_fqdn` | Defined hostname to used as apache virtualhost


Dependencies
------------

OpenJDK and apache-proxy if variables `rundeck_apache_proxy_enable` is set to `True`.

Example Playbook
----------------

Simple example installing Rundeck :

```yml
- hosts: rundeck
  roles:
    - role: rundeck
```

**NB** : Rundeck is accessible from **http://ansible_hostname:4440** with access **admin**/**changeme**


Example with apache in reverse proxy in front of Rundeck :

```yml
---
- hosts: rundeck
  roles:
    - role: rundeck
      rundeck_admin_pass: S3curP@33wD
    - role: apache-proxy
      apache2_proxies:
        "{{ ansible_hostname }}":
          server_aliases:
            - "{{ ansible_fqdn }}"
          http_backends:
            - "127.0.0.1:{{ rundeck_port }}"
```

**NB** : Rundeck is accessible from **http://asnible_hostname** with access **admin**/**S3curP@33wD**
