Next Cloud
=========

This role deploy nexcloud.

Role Variables
--------------

Variables              |  Default value      |  Description
-----------------------|:-------------------:| -------------------------------------
`nextcloud_version`    |  "19.0.1"           | Nextcloud version du deployed
`nextcloud_repository` |  https://download.nextcloud.com/server | Repository server to download Nextcloud
`nextcloud_download_url` |  | Full Nextcloud download URL
`nextcloud_admin_user` |  admin              | Nextcloud administrator user login
`nextcloud_admin_pass` |  changeme           | Nextcloud administrator user password
`nextcloud_hosts`      | [`inventory_hostname`] | Nextcloud hosts list in case of cluster deployment


Web server configuration settings :

Variables            |  Default value       |  Description
---------------------|:--------------------:| -------------------------------------
`nextcloud_vhost_name` | nextcloud           | Nextcloud virtualhost name
`nextcloud_vhost_aliases` | []               | Nextcloud virtualhost aliases
`nextcloud_trusted_extra_domains` | [ `ansible_fqdn`, `ansible_default_ipv4.address`] | Nextcloud extra trusted domain to allowed in addition of `nextcloud_vhost_name` and `nextcloud_vhost_aliases` list
`nextcloud_webroot_dir` |  /var/www          | Web server data dir
`nextcloud_root_dir` | `nextcloud_webroot_dir`/`nextcloud_vhost_name` | Nextcloud vhost document root
`nextcloud_max_upload_size` |  1G    | PHP max upload file size
`nextcloud_max_upload_time` |  1000  | PHP max upload time
`nextcloud_config_system`       |  {}    | Nextcloud system configuration (*php occ config:system:set*). See example below. You can list all options available for *system* with command *php occ config:list* web server.
`nextcloud_config_app`          |  {}    | Nextcloud application configuration (*php occ config:app:set*). See example below. You can list all options available for *apps* with command *php occ config:list* on nextcloud web server.
`nextcloud_php_version` | 7.3 | Specify php version to install
`nextcloud_protocol` | http | Specify nextcloud protocol, http or https

Nextcloud Security settings :

Variables                       |  Default value       |  Description
--------------------------------|:--------------------:| ------------------------------
`nextcloud_encryption_enable`   |  True  | Enabled data encryption (incompatible with S3 object storage !)
`nextcloud_pwd_non_common`      |  True  | Ensure password is not a common simple password
`nextcloud_pwd_num_characters`  |  True  | Password need numeric characters
`nextcloud_pwd_spec_characters` |  True  | Password need special characters
`nextcloud_pwd_upperlower_case` |  True  | Password need upper and lower characters


Database configuration settings :

Variables            |  Default value       |  Description
---------------------|:--------------------:| -------------------------------------
`nextcloud_db_backend`|  mariadb            | Database backend to be used (mysql/mariadb, galera, pgsql)
`nextcloud_db_host`   |  127.0.0.1          | Database host address used by Nextcloud to access database
`nextcloud_db_remote_host` | `inventory_hostname` | Real database server host address used by ansible via SSH to provisionning database. Usefull in case of cluster where `nextcloud_db_host` is not a database server but for example a VIP own by an HAProxy in case of Galera cluster.
`nextcloud_db_name`   |  nextcloud          | Database name
`nextcloud_db_user`   |  nextcloud          | Database user
`nextcloud_db_pass`   |  `auto generated`   | Database password


Redis configuration settings :

Variables              |  Default value       |  Description
-----------------------|:--------------------:| -------------------------------------
`nextcloud_use_redis`  |  false               | Enable/Disable redis (default disable)
`nextcloud_redis_host` |  127.0.0.1           | Redis host server address
`nextcloud_redis_port` |  6379                | Redis port to used to connect to redis server
`nextcloud_redis_db`   |  0                   | Redis database indexe to be used
`nextcloud_redis_password` | `redis_password` | Redis password used to authenticate


S3 configuration settings :

Variables             |  Default value  |  Description
----------------------|:---------------:| -------------------------------------
`nextcloud_use_s3`    |   false         | Enable S3 object storage
`nextcloud_s3_host`   |   127.0.0.1     | S3 host address
`nextcloud_s3_port`   |   7480          | S3 port
`nextcloud_s3_key`    |                 | S3 key to authenticate to S3 server
`nextcloud_s3_secret` |                 | S3 secret to authenticate to S3 server
`nextcloud_s3_bucket` |   nextcloud     | S3 Bucket name
`nextcloud_s3_ssl`    |   false         | Use SSL to access S3 server

Dependencies
------------

* apache
* php

Example Playbook
----------------

```
---
  - hosts: serveur
    roles:
      - role: mariadb-server
      - role: nextcloud
        nextcloud_config_app:
          password_policy:
            enforceUpperLowerCase: 1
            enforceNumericCharacters: 1
            enforceSpecialCharacters: 1
          redis:
            host: 127.0.0.1
            port: 6379
            redis: changeme

```

Author Information
------------------

* Michel GRABA, <migra@smile.ci>
* Jean KASSI, <jekas@smile.ci>
* Sebastien GIRAUD, <segir@smile.ci>
