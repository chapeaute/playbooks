Traefik
=========

Install and configure Traefik reverse proxy HTTP and dynamic load balancer

Requirements
------------

None.

Role Variables
--------------

Treafik global configuration variables :

Variable | Default value |Description
---------|---------------|--------------
`traefik_version` | 2.3.0 | Traefik version to install
`traefik_download_url` | https://github.com/containous/traefik/releases/download/v{{ traefik_version }}/traefik_v{{ traefik_version }}_linux_amd64.tar.gz | Traefik download URL
`traefik_force_version` | no | Force ansible to replace traefik binary by `traefik_version` version
`traefik_override_conf` | True | Override traefik main configuration, if it exist with template
`manage_firewalld` | True | Configure firewalld

Dashboard variables configuration :

Variable | Default value |Description
---------|---------------|--------------
`traefik_dashboard_enable` | True | Enable traefik dashboard
`traefik_dashboard_port` | 8080 | Default traefik port to access dashboard interface
`traefik_dashboard_username` | admin | Username to be used to access dashboard interface
`traefik_dashboard_password` | changeme | Password to be used to access dashboard interface

Metrics variables :

Variable | Default value |Description
---------|---------------|--------------
`traefik_metric_enable` | False | Enable/Disable metric module to be used by external monitoring engine (Prometheus)
`traefik_metric_port` | 7979 | Port of metric API

Etcd variables :

Variable | Default value |Description
---------|---------------|--------------
`traefik_etcd_hosts` | [] | Etcd hosts servers list
`traefik_etcd_port` | [] | Etcd port

Dependencies
------------

None.

Example Playbook
----------------

```yml
- hosts: traefik
  roles:
    - role: traefik
```

Usefull URL :

* http://127.0.0.1:8080/dashboard
* http://127.0.0.1/api

Scripts
-------

Following scripts are available :

* **traefik-healthcheck** : Display traefik information and health

```bash
$ traefik-healthcheck
```
