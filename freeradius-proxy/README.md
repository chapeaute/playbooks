FreeRADIUS-Proxy
=========

This role install and configure FreeRadius Proxy Serveur and load balance connexion on a pool of backend freeradius server.

A client is automatically configure on backend freeradius server to allow communication between proxy and server.

Requirements
------------

None.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

`freerad_vhost` table variables for new virtualhost proxy declaration :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `freerad_vhost.name` | **mandatory** | Name of virtualhost used to identified service. |
| `freerad_vhost.lb_type` | `load-balance` | Type of load balancing used (load-balance, fail-over). |
| `freerad_vhost.rq_type` | `auth+acct` | Type of request to proxy to used. By default, authorize both authentication and accounting request. |
| `freerad_vhost.secret` | `testing123` | Password use to initialize connexion with freeradius server. |
| `freerad_vhost.port` | `1812` | Default freeradius port for authentication. |
| `freerad_vhost.home_server` | ['localhost'] | Default backend server list to forward requests. |

Dependencies
------------

freeradius

Example Playbook
----------------

Simple example :

```yaml
---
- hosts: freeradius-proxy
  roles:
    - role: freeradius                                                        
      freerad_client_vhost: proxy
    - role: freeradius-proxy
      freerad_vhost:
        - name: default
          servers: [ 'radius-srv-1', 'radius-srv-2' ]
```

Complete example with freeradius server and freeradius proxy (freeradius-adsl and freeradius-wifi must be deploy before proxy) :

```yaml
---
- hosts: freeradius-adsl
  roles:
     - role: freeradius
       freerad_client_vhost: adsl

- hosts: freeradius-wifi
  roles:
     - role: freeradius
       freerad_client_vhost: wifi

- hosts: freeradius-proxy
  roles:
    - role: freeradius
      freerad_client_vhost: proxy
    - role: freeradius-proxy
      freerad_vhost:
         - name: adsl
           servers: [ 'radius-adsl-1', 'radius-adsl-2' ]
           secret: enNzZQvZNSk92sWT
         - name: wifi
           servers: [ 'radius-wifi-1', 'radius-wifi-2' ]
           secret: il7IPd0tJTYHLhDT
```
