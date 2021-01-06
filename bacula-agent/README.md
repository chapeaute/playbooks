Bacula Agent
=========

This module deploy the bacula-agent


Role Variables
--------------

| Variables               |     Default values           |   Descriptions                     |
| ------------------------|:--------------------------- :| ----------------------------------:|
| `bacula_fd_port`        | 9102                         | Port of bacula client              |
| `bacula_fd_name`        | `ansible_fqdn`           | Bacula file daemon name            |
| `bacula_fd_bind_addr`   | 0.0.0.0                      | File Daemon Bind Address           |
| `bacula_fd_password`    | `auto generated`             | password for file daemon password  |
| `bacula_fd_max_concurrent_job` | 5                     | client maximum concurrent jobs for multi streaming |
| `bacula_fd_restore_dir` | /var/lib/bacula-restores     | Restore directory                  |
| `bacula_tmp_backup_dir` | /var/backup    | Temporary backup directory                  |
| `bacula_fd_heartbeat_interval` | 60                | Heartbeat interval to maintain active connexion with director |
| `bacula_fd_regenerate_config`  | yes               | Regenerate bacula fd configuration |
| `bacula_dir_host`       | bacula                   | Bacula director Server address IP  |
| `bacula_dir_name`       | `bacula_dir_host`        | Name of director                   |
| `bacula_sd_hosts`       | [ `bacula_dir_host` ]    | List of bacula sd hosts            |
| `filesets`              |        []                | Include/exclude list of files and directories to backup according to client inventory group appartenance |

Dependencies
------------

None

Example Playbook
----------------

Simple example for test :

```yaml
---
- hosts: bacula-agent
  roles:
  - role: bacula-agent
    bacula_dir_host: bacula
```

Simple example for production :

```yaml
---
- hosts: bacula-agent
  roles:
  - role: bacula-agent
    bacula_dir_host: bacula
    bacula_fd_password: S3cr3Tp@ssw0rD
    filesets:
      - name: bacula-agent
        include:
          - /etc/
          - /usr/local/bin
          - /usr/local/sbin
          - /var/spool/cron
      - name: haproxy
        include:
          - /etc/haproxy
      - name: mariadb
        include:
          - /etc/my.cnf
          - /etc/my.cnf.d
          - /var/backup/mysql
        before: /usr/local/sbin/mysql-backup-dump
        after: /usr/local/sbin/mysql-backup-clean
```


Author Information
------------------

* Michel GRABA, <migra@smile.ci>
* Jean KASSI, <jekas@smile.ci>
