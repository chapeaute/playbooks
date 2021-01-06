MongoDB
=========

This role install mongodb. It supports replica set cluster mode.

Requirements
------------

None.

Role Variables
--------------

Variable | Default value |Description
---------|---------------|--------------
`mongodb_version` | 4.2 | MongoDB verstion
`mongodb_bind_port` | 27017 | MongoDB bind port
`mongodb_hosts`  | [] | List of mongodb servers, if length > 2 enable cluster
`mongodb_bind_address` | 0.0.0.0 | MongoDB bind IP
`mongodb_admin_user` | root | MongoDB admin user
`mongodb_admin_pass` | `auto generated` | MongoDB admin password
`mongodb_data_dir` | /var/lib/mongo | Default data dir
`mongodb_log_dir` | /var/log/mongodb | Default log dir
`mongodb_backup_dir` | /var/backup/mongo | Default backup retention
`mongodb_backup_age` | 0 | Default backup dir
`mongodb_replica_set_name` | default-replica-set | Replicaset name if installed on a cluster of 2 or more nodes
`manage_by_cluster` | False | Variable set to true if service state must be managed by a cluster solution (like PCS)

Parameter for MongoDB tuning :

Variable | Default value |Description
---------|---------------|--------------
`mongodb_thp_disable` | `True` | Disable THP (Transparent Huge Pages)
`mongodb_sysctl_vm_dirty_ratio` | 10 | The "dirty ratio" is the percentage of total system memory that can hold dirty pages
`mongodb_sysctl_vm_dirty_background_ratio` | 3 | When exceed the limit, the dirty pages are committed to disk, creating a small pause. To avoid this hard pause there is a second ratio "dirty background ratio" (default 10-15%) which tells the kernel to start flushing dirty pages to disk in the background without any pause
`mongodb_sysctl_vm_swappiness` | 5 | "Swappiness" is a Linux kernel setting that influences the behavior of the Virtual Memory manager when it needs to allocate a swap, ranging from 0-100. A setting of "0" tells the kernel to swap only to avoid out-of-memory problems. A setting of 100 tells it to swap aggressively to disk.

Dependencies
------------

* None

Example Playbook
----------------

Simple MongoDB example :

```yaml
- hosts: all
  roles:
      - role: mongodb
```

Advanced MongoDB example :

```yaml
- hosts: all
  roles:
    - role: mongodb
      mongodb_data_dir: /srv/mongodb
      mongodb_backup_dir: /srv/backup/mongodb
      mongodb_bind_address: 127.0.0.1
```

Scripts
-------

Following scripts are available :

* **mongodb-backup-clean** : Purge old dump from backup directory

Purge all backup :

```bash
# mongodb-backup-clean
```

Purge backup older than **5** days :

```bash
# mongodb-backup-clean -o 5
```

* **mongodb-backup-dump** : Dump MongoDB database in */var/backup/mongo/backup-YYYYMMDD_HHMM/*

Dump all databases :

```bash
# mongodb-backup-dump
```

Dump only **test** databases :

```bash
# mongodb-backup-dump -n test
```

* **mongodb-backup-restore** : Restore MongoDB databases

Restore all database in directory */var/backup/mongo/backup-20171218_1519* :

```bash
/usr/local/sbin/mongodb-backup-restore -d /var/backup/mongo/backup-20171218_1519/
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
# You can relaunch test after with existing instances
ansible-playbook playbook
```

Docs on testing:
https://molecule.readthedocs.io
