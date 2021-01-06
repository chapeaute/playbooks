MariaDB Galera Cluster
=========

An Ansible role to install/configure mariadb galera cluster https://mariadb.org/

Requirements
------------

None

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

Variable | Default value | Description
-------- | ------------- | -----------
`galera_cluster_name` | galera-cluster | Define the name of the cluster
`galera_cluster_bind_address` | 0.0.0.0 | Define bind address for galera cluster
`galera_cluster_nodes_group` | galera-cluster-nodes | Define inventory group nodes used to form cluster
`galera_nodes` | group[galera\_cluster\_nodes\_group] | Define inventory group nodes used to form cluster
`galera_master_node` | {{ galera\_nodes[0] }} | Set master node used to initialized cluster. If not defined used the first host on cluster node list `galera_nodes`
`galera_reconfigure` | false | Define if the cluster should be reconfigured. Necessary to defined `galera_master_node` with host having most recent data. Reconfigure can be force by using `force` value which remove **grastate.dat** file before creating cluster
`mariadb_version` | 10.2 | MariaDB version to used. One of version defined here : http://yum.mariadb.org/
`mariadb_data_dir` | /var/lib/mysql | MariaDB data directory
`mysql_default_backup_dir` | /var/backup/mysql | Default backup directory used by backup scripts
`mysql_backup_dir` | {{ mysql_default_backup_dir }} | backup directory used by backup scripts
`mariadb_innodb_buffer_pool_size_prct` | 0.7 | Percent of RAM used for InnoDB buffer pool size
`mariadb_innodb_buffer_pool_size` | {{(ansible_memtotal_mb*mariadb_innodb_buffer_pool_size_prct)}}M | Size calculate from `mariadb_innodb_buffer_pool_size_prct` and total memory available on host
`mariabd_max_connections` | 250 | Set MariaDB max concurrent connections
`mariadb_root_password` | `auto generated` | Define MariaDB root password
`mariadb_root_allow_from_any` | false | Define if root logins should be allowed from any host
`mariadb_wsrep_sst_method` | rsync | SST method to be used to replicate data from donor to desync node
`mariadb_wsrep_sst_user` | wsrepuser | Define xtrabackup user
`mariadb_wsrep_sst_password` | `auto generated` | Define xtrabackup password
`mariabd_systemd_timeoutsec` | 6h | Timeout to wait for service to start (needed with large data and rsync sst_method)
`monitoring_galera_enable` | true | Deploy galera monitoring scripts
`monitoring_galera_script_name` | galera-check | Galera script used to monitor cluster for load balancer via xinetd on port 9200
`monitoring_galera_script_path` | /usr/local/bin | Path where Galera monitoring script will be put
`monitoring_nagios_enable` | false | Define if monitoring should be enabled for MariaDB

### Nagios monitoring

Enable remote nagios monitoring

Variable | Default value | Description
---------|---------------|----------------
`monitoring_nagios_server_fqdn` | % | Defines the remote monitoring server
`monitoring_nagios_db_user` | nagios | Define the user for monitoring db... define here or globally in group_vars/all/accounts
`monitoring_nagios_db_pass` | changeme | Define the password for monitoring db... define here or globally in group_vars/all/accounts
`use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role.

### PMM monitoring

Create user and set specific MySQL configuration to enable innodb stats and performance schema

Variable | Default value | Description
---------|---------------|----------------
`monitoring_pmm_enable` | false | Define if monitoring should be enabled for PMM
`monitoring_pmm_db_user` | pmm | Define the user name for monitoring db... define here or globally in group_vars/all/accounts
`monitoring_pmm_db_pass` | changeme | Define the user password for monitoring db... define here or globally in group_vars/all/accounts

### Firewall management

Enable or disable firewall management

Variable | Default value | Description
---------|---------------|----------------
`manage_firewalld` | true | Enable or disable firewall configuration


Dependencies
------------

None

Example Playbook
----------------

Simple example :

```yaml
---
- hosts: all
  roles:
    - role: mariadb-galera-cluster
      galera_nodes: "{{ play_hosts }}"
```

Complete example for production environment :

```yaml
---
- hosts: galera
  roles:
    - role: mariadb-galera-cluster
      galera_cluster_name: galera-cluster
      galera_nodes: "{{ play_hosts }}"
      mariadb_data_dir: /srv/mysql/data
      mariadb_root_password: S3cureP@ssW0rd
      mariadb_wsrep_sst_password: WSrepS3cureP@ssW0rd
      monitoring_galera_enable: true
      monitoring_nagios_enable: true
      monitoring_nagios_db_user: centreon
      monitoring_nagios_db_pass: N@gI05
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

```bash
molecule lint # lint role
molecule test # launch test from scracth
# You can relaunch test after with existing instances
ansible-playbook playbook
```

Docs on testing:
https://molecule.readthedocs.io
