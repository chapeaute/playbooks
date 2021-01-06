Bacula Director
=========

This module deploy the bacula director


Role Variables
--------------

| Variables                              |   Default value          |   Descriptions                       |
| -------------------------------------- |:------------------------:| ------------------------------------:|
| `bacula_dir_name`                      | bacula-dir               | Director name                        |
| `bacula_dir_host`                      | {{ ansible_fqdn }}       | Director host                        |
| `bacula_dir_password`                  | `auto generated`         | Password used by console tools to connect to director |
| `bacula_dir_address`                   | {{ bacula_dir_host }}    | Director IP address                  |
| `bacula_dir_port`                      | 9101                     | Port of the director                 |
| `bacula_dir_restore`                   | /var/lib/bacula-restores | Restore directory                    |
| `bacula_dir_max_current_job`           | 10                       | Maximum job running simultaneously   |
| `bacula_daily_default_retention`       | 14                       | Default day retention for job, file and volume |
| `bacula_daily_job_retention`           | {{ bacula_daily_default_retention }} | Daily Pool File retention   |
| `bacula_daily_file_retention`          | {{ bacula_daily_default_retention }} | Daily Pool Job retention    |
| `bacula_daily_volume_retention`        | {{ bacula_daily_default_retention }} | Daily Pool Volume retention |
| `bacula_daily_volume_use_duration`     | 23 hours                 | Daily Volume usage duration          |
| `bacula_weekly_default_retention`      | 21                       | Default week retention for job, file and volume |
| `bacula_weekly_job_retention`          | {{ bacula_weekly_default_retention }} | Weekly Pool Job retention    |
| `bacula_weekly_file_retention`         | {{ bacula_weekly_default_retention }} | Weekly Pool File retention   |
| `bacula_weekly_volume_retention`       | {{ bacula_weekly_default_retention }} | Weekly Pool Volume retention |
| `bacula_weekly_volume_use_retention`   | 23 hours                 | Weekly Volume use duration           |
| `bacula_schedule_full`                 | sun at 23:05             | Full backup date                     |
| `bacula_schedule_diff`                 | mon-sat at 23:05         | Differential backup date             |
| `bacula_db_driver`                     | mysql                    | DB driver (only mysql is supported)  |
| `bacula_db_host`                       | 127.0.0.1                | Database host                        |
| `bacula_db_port`                       | 3306                     | Database port                        |
| `bacula_db_user`                       | bacula                   | Username used by bacula to log on DB |
| `bacula_db_password`                   | `auto generated`         | Password used by bacula to log on DB |
| `bacula_db_name`                       | bacula                   | Database name                        |
| `bacula_db_remote_host`                | {{ inventory_hostname }} | Database remote host used to init bacula DB    |
| `bacula_db_admin_user`                 | root                     | Database admin user used to init bacula DB     |
| `bacula_db_admin_password`             | changeme                 | Database admin password used to init bacula DB |
| `bacula_sd_hosts`                      | [{{ bacula_dir_host }}]  | Database admin password used to init bacula DB |

Dependencies
------------

mariadb-server role

Example Playbook
----------------

Simple example :

```yaml
---
- hosts: all
  roles:
    - role: mariadb-server
    - role: bacula-server
```

Simple example for production :

```yaml
---
- hosts: all
  roles:
    - role: mariadb-server
      mysql_config_bind_address: 127.0.0.1
      mysql_config_innodb_buffer_pool_size_prct: 0.5
      mysql_root_password: AdminDBDirS3cr3Tp@ssw0rD
    - role: bacula-server
      bacula_db_host: 127.0.0.1
      bacula_db_remote_host: bacula
      bacula_dir_password: DirS3cr3Tp@ssw0rD
      bacula_sd_password: SDS3cr3Tp@ssw0rD
      bacula_db_pass: BaculaDBS3cr3Tp@ssw0rD
      bacula_db_admin_pass: AdminDBDirS3cr3Tp@ssw0rD
```

Author Information
------------------
 michel.graba@smile.ci, koffi.michel74@gmail.com,sysadmins at smile-ci,www.smile.ci
