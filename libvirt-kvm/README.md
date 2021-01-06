Libvirt-KVM
=========

Install KVM + Libvirt and allow to create iface and pool object.


Requirements
------------

**Important:** Entry **devpts** in _/etc/fstab_ file is updated during role deployment. Server must be reboot after installation to allow KVM to run.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

Variables for backup management :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `libvirt_cron_backup_disabled` | false | If the cron should be disabled in the crontab |
| `libvirt_cron_backup_compress` | false | If enable compress backup file after backup |
| `libvirt_backup_default_dir` | /var/backup/libvirt | Specify libvirt default backup directory |
| `libvirt_backup_default_retention` | 3 | Define default retention period for backup type |
| `libvirt_backup_daily_dir` | {{libvirt_backup_default_dir}}/daily | Specify libvirt daily backup directory |
| `libvirt_backup_daily_retention` | 3 | Define daily retention period for backup type |
| `libvirt_backup_weekly_dir` | {{libvirt_backup_default_dir}}/weekly | Specify libvirt weekly backup directory |
| `libvirt_backup_weekly_retention` | 2 | Define weekly retention period for backup type |
| `libvirt_backup_monthly_dir` | {{libvirt_backup_default_dir}}/monthly | Specify libvirt monthly backup directory|
| `libvirt_backup_monthly_retention` | 1 | Define monthly retention period for backup type |
| `libvirt_backup_default_bandwith` | 0 | Define bandwith limitation in MB/s during transfert (0 is unlimited) |


Variable for pool management :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `libvirt_pools` |  | Create Pool |
| `libvirt_pools.name` |  | Pool name |
| `libvirt_pools.path` |  | Pool directory on host |

Variable for network management :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `libvirt_networks` |  | Create libvirt network interface and bridge on VLAN ID |
| `libvirt_networks.client` |  | Client identity |
| `libvirt_networks.vlanid` |  | VLAN ID |
| `libvirt_networks.netif`  |  | Physical network interface on host attach to bridge |
| `libvirt_networks.ipaddr`  |  | Host IP address to set on bridge |
| `libvirt_networks.prefix`  |  | Host IP prefix to set en bridge |


Dependencies
------------

None.

Example Playbook
----------------

Simple example :

```yaml
---
- hosts: all
  roles:
    - role: libvirt-kvm
```

Network playbook example :

```yaml
---
- hosts: all
  roles:
    - role: libvirt-kvm
      libvirt_networks:
        - client: smile
          vlanid: 201
          netif:  eth1
          ipaddr: 10.2.1.22
          prefix: 24
        - client: sfl
          vlanid: 202
          netif:  eth1
        - client: scs
          vlanid: 203
          netif:  eth1
```

Pool playbook example :

```yaml
---
- hosts: all
  roles:
    - role: libvirt-kvm
      libvirt_pools:
        - name: hdd
          path: /var/lib/libvirt/pool/hdd
        - name: ssd
          path: /var/lib/libvirt/pool/ssd
```
