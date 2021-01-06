Tomcat
=========

This role install a tomcat server

Requirements
------------

This module needs a function java jdk set, openjdk or oracle.
You can either use: openjdk or oracle-java

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `tomcat_version` | 9 | Tomcat major version to install |
| `tomcat_full_version` | 9.0.34 | Tomcat specific version to install |
| `tomcat_java_version` | 8 | JDK version |
| `tomcat_java_impl` | openjdk | JDK implementation (possible value: **oraclejdk** or **openjdk**)  |
| `tomcat_libraries` | catalina-jmx-remote.jar,tomcat-juli-adapters.jar | Library to install |
| `tomcat_use_mysql` | False | Set to true if you want to install the MySQL JDBC driver |
| `tomcat_install_dir` | "/var/lib" | Tomcat installation directory |
| `tomcat_root_dir` | "{{tomcat_install_dir}}/tomcat" | Tomcat root installation directory name |
| `tomcat_log_dir` | "/var/log/tomcat" | Tomcat logs symlink dir |
| `tomcat_http_port` | 8080 | Tomcat binding port |
| `tomcat_ajp_port` | 8009 | AJP binding ort |
| `tomcat_jmx_registry_port` | 10080 | JMX registry binding port |
| `tomcat_jmx_server_port` | 10081 | JMX server binding port |
| `tomcat_limit_open_files` | 65535 | Limit open files number |
| `ipv6_disable` | True | Enable/Disable IPv6 |
| `tomcat_user` | "tomcat" | User used to run tomcat service |
| `tomcat_uid` |  | User uid for tomcat user |
| `tomcat_group` | "tomcat" | Group used to run tomcat service |
| `tomcat_gid` |  | Group gid for tomcat group |
| `tomcat_admin_user` | "admin" | Admin user login name |
| `tomcat_admin_pass` | "admin" | Admin user password |
| `tomcat_heap_size_prct` | 0.85 | Pourcentage of memory reserved to tomcat |
| `tomcat_min_heap_size` | {{(ansible_memtotal_mb\*tomcat_heap_size_prct)}} | Min memory heap size |
| `tomcat_max_heap_size` | {{tomcat_min_heap_size}} | Max memory heap size |
| `tomcat_min_metaspace_size` | 128M | Min memory metaspace |
| `tomcat_max_metaspace_size` | 128M | Max memory metaspace |
| `tomcat_upload_max_size` | 52428800 | Max upload filesize in bytes (50M) |
| `tomcat_env_vars` |  | Tomcat service configuration variables |
| `tomcat_gc_log_file` | "{{tomcat_root_dir}}/logs/gc.log" | Garbage collector log file |
| `tomcat_heap_dump_dir` | "{tomcat_root_dir}}/logs/" | Dump directory on out of memory error |
| `tomcat_centreon_enable` | true | Enable/Disable monitoring user |
| `tomcat_centreon_user` | "centreon" | Centreon user login name |
| `tomcat_centreon_pass` | "changeme" | Centreon user password |
| `tomcat_jolokia_version` | 1.6.0 | Jolokia version to download
| `tomcat_logrotate_days` | daily | Tomcat frequency rotation |
| `tomcat_logrotate_size` | 512M | Minimum file size of catalina.out before rotating |
| `tomcat_logrotate_rotate` | 7 | Maximum number of logrotate to conserve before removing |
| `tomcat_display_version` | Web Applications Server | Hide version and display this message instead of tomcat version on error page. |

To deploy a new webapp, the main variable of this role is `java_app`.

Variable | Default value |Description
---------|---------------|--------------
`name` | Mandatory | Name of the context
`conf_files` | None | Settings files list
`log_file` | Mandatory | Path to the application log file
`logrotate_conf` | None |
`tomcat_user` | Mandatory | System user in charge of Tomcat process
`context` | None | Path to the application context file
`war` | Mandatory | Path to the application war file

Dependencies
------------

Use **openjdk** role if `tomcat_java_impl` is set to value **openjdk** (default). Otherwise, **oracle-java** can be used if `tomcat_java_impl` is set to **oraclejdk**.

Example Playbook
----------------

Simple example to install tomcat :

```yaml
---
- hosts: all
  roles:
    - role: tomcat
```

Simple example to install tomcat 7 with Oracle JDK :

```yaml
---
- hosts: all
  roles:
    - role: tomcat
      tomcat_full_version: 7.0.59
      tomcat_java_version: 7
      tomcat_java_impl: oraclejdk
      tomcat_heap_size_prct: 0.4
```

Example to install tomcat 8 for production usage :

```yaml
---
- hosts: all
  roles:
    - role: tomcat
      tomcat_admin_user: admin
      tomcat_admin_pass: "S3cr3tS3cur3P@55wD"
```

Here is how to deploy a new webapp :

```yaml
---
- hosts: all
  roles:
    - role: tomcat
      java_app:
        name: my-super-app
        conf_files:
          - conf/app/conf-file-1-ext.properties
          - conf/app/conf-file-2-ext.properties
        log_file: /var/log/my-super-app/my-super-app.log
        logrotate_conf: conf/my-super-app.logrotate
        tomcat_user: tomcat7
        context: conf/context.xml.j2
        war: PATH/TO/WAR/FILE
```

Scripts
-------

Following scripts are available :

* **tomcat-app-deploy** : Deploy new tomcat application

```bash
# tomcat-app-deploy -n sample -f /tmp/sample.war
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
```

Docs on testing:
https://molecule.readthedocs.io

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
