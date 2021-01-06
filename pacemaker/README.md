Pacemaker/Corosync
=========

Install and configure corosync/pacemaker cluster by defining resource for VIP, Service and DRBD.

Requirements
------------

If using DRBD, resource must be already configure and a Primary node must be already set.

**IMPORTANT: For cluster to work, ensure /etc/hosts is correctly configure. Host entry define in /etc/hosts must be set according to DNS resolution. That is to say with the same IP and hostname return by DNS resolution !**

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `pcmk_cluster_name` | pacemaker | Cluster name |
| `pcmk_hacluster_passwd` | changeme | Password for user hacluster |
| `pcmk_node_timeout` | 120 | Timeout in second before considering node in cluster unavailable |
| `pcmk_hosts` | **mandatory** | Cluster list of server |
| `pcmk_drbd_rsc` |  | DRBD resources declaration |
| `pcmk_vip_rsc` |  | VIP resources declaration |
| `pcmk_svc_rsc` |  | Service resources declaration |
| `firewall_setup` | true | If firewall |

Dependencies
------------

None.

Example Playbook
----------------

Simple example using VIP resource:

```yaml
---
- hosts: all
  roles:
    - role: pacemaker
      pcmk_hosts: "{{ groups['centos7-ha'] }}"                                                                         
      pcmk_hacluster_passwd: 'sigipsr'                                                     
      pcmk_vip_rsc:
        - interface: enp0s3
          address: 192.168.56.45
          netmask: 24
```

Simple example using Service resource:

```yaml
---
- hosts: all
  roles:
    - role: pacemaker
      pcmk_hosts: "{{ groups['centos7-ha'] }}"
      pcmk_svc_rsc:
        - mariadb
```

Simple example using DRBD resources:

```yaml
---
- hosts: all
  roles:
    - role: pacemaker
      pcmk_hosts: "{{ groups['centos7-ha'] }}"
      pcmk_drbd_rsc:
        rsc_name: data
        mnt_point: /srv
```

Complexe example for MySQL cluster. Use DRBD resource **data**, mount DRBD device on **/srv** directory, migrate **/var/lib/mysql** to **/srv/mysql**, add VIP on cluster, and manage **mariadb** services :

```yaml
---
- hosts: all
  roles:
    - role: pacemaker
      pcmk_hosts: "{{ groups['centos7-ha'] }}"
      pcmk_drbd_rsc:
        rsc_name: data
        mnt_point: /srv
        dir:
          - src_dir: /var/lib/mysql
            dst_dir: /srv/mysql
      pcmk_vip_rsc:
        - interface: enp0s3
          address: 192.168.56.45
          netmask: 24
      pcmk_svc_rsc:
        - mariadb
```

Complexe example using multiple resources :

```yaml
---
- hosts: all
  roles:
    - role: pacemaker
      pcmk_hosts: "{{ groups['centos7-ha'] }}"
      pcmk_drbd_rsc:
        rsc_name: data
        mnt_point: /srv
        dir:
          - src_dir: /var/lib/mysql
            dst_dir: /srv/mysql
          - src_dir: /var/www
            dst_dir: /srv/www
      pcmk_vip_rsc:
        - interface: enp0s3
          address: 192.168.56.45
          netmask: 24
        - interface: enp0s3
          address: 192.168.56.48
          netmask: 24
      pcmk_svc_rsc:
        - mariadb
        - httpd
```
