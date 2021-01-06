bacula-storage
=========

This module deploy the bacula storage daemon

Requirements
------------

None

Role Variables
--------------

| Variables                              |   Default value          |   Descriptions                       |
| -------------------------------------- |:------------------------:| ------------------------------------:|
|   `bacula_dir_host`                    |      bacula              |     Bacula director ip address       |
|   `bacula_dir_name`                    |      bacula-dir          |     Name of director                 |
|   `bacula_dir_service`                 |      bacula-dir          |     Name of bacula director service  |
|   `bacula_sd_name`                     |  `ansible_fqdn`      |     Name of storage server           |
|   `bacula_sd_password`                 |     `auto generated`     |     Storage Password                 |
|   `bacula_sd_address`                  | `ansible_fqdn`     |     Name of bacula storage           |
|   `bacula_sd_port`                     |        9103              |     Port of bacula sd                |
|   `bacula_sd_archive_device`           |      /var/spool/bacula     |     Backup directory                 |
|   `bacula_sd_media_type`               |        File              |     Media Type                       |
|   `bacula_sd_max_concurrent_jobs`      |         10               |     Max concurrent jobs              |
|   `bacula_dir_restore`                 | /var/lib/bacula-restores |     Restore directory                |


Schedule variables :

| Variables | Default value | Descriptions |
| --------- |:-------------:| ------------:|
| bacula_schedule_full | "sun at 00:05" | Schedule time for Full backup
| bacula_schedule_diff | "mon-sat at 00:05" | Schedule time for Differential backup
| bacula_daily_default_retention | 14 | Default daily retention period
| bacula_daily_volume_use_duration | 23 hours | Volume use duration for daily backup
| bacula_daily_file_retention | `bacula_daily_file_retention` | File retention for daily backup
| bacula_daily_job_retention | `bacula_daily_file_retention` | Job retention for daily backup
| bacula_daily_volume_retention | `bacula_daily_file_retention` | Volume retention for daily backup
| bacula_weekly_default_retention | 21 | Default daily retention period
| bacula_weekly_volume_use_duration | 23 hours | Volume use duration for weekly backup
| bacula_weekly_file_retention | `bacula_weekly_default_retention` | File retention for weekly backup
| bacula_weekly_job_retention | `bacula_weekly_default_retention` | Job retention for weekly backup
| bacula_weekly_volume_retention | `bacula_weekly_default_retention` | Volume retention for weekly backup



Dependencies
------------

None

Example Playbook
----------------

Sample playbook

```yaml

 - hosts: servers
   roles:
      - role: bacula-storage
```

```yaml
 - hosts: servers
   roles:
     - role: bacula-storage
       bacula_dir_host: bacula
```



License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
