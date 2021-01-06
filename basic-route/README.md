Basic-route
=========

Add route to interface on CentOS.

Requirements
------------

None.

Role Variables
--------------

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `gateway_itf` |  | Interface on which default gateway is assigned |
| `gateway_addr` |  | IP address on gateway
| `route` | {} | Dictionary of interface with route list inside |


Dependencies
------------

None.

Example Playbook
----------------

Example to add routes on somes interfaces :

```yaml
- hosts: all
  roles:
  - role: basic-route
    route:
      eth0:
        - 192.168.2.0/23 via 172.18.0.2
        - 192.168.10.0/24 via 172.18.0.2
      eth1:
        - 172.16.3.0/24 via 172.22.0.2
        - 172.16.5.0/24 via 172.22.0.2
```


Example to set default route on interface:

```yaml
- hosts: all
  roles:
  - role: basic-route
    route: {}
    gateway_itf: eth1
    gateway_addr: 192.168.122.1
