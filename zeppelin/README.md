Zeppelin
=========

This role allows you to configure a [Zeppelin](https://www.zeppelin.org/) service on your system.

It mainly wraps the generic-service role to ease its use.

Role Variables
--------------

Variable | Default value |Description
---------|---------------|--------------|
| `zeppelin_root_dir` | /var/lib | Zeppelin installation dir
| `zeppelin_java_version` | 8 | The java
version to be installed
|`zeppelin_java_impl` | openjdk | The java implementation to be installed (possible values: **openjdk** or **oraclejdk**)
| `zeppelin_memory_size_prct` | 0.6 | Percentage of total memory allocated |
| `zeppelin_server_port` | 9090 | Port to bind for zeppelin server
| `zeppelin_anonymous_login` | true | Allow anonymous conncections
| `zeppelin_users` | [] | Zepeling users |

Requirements
------------

* openjdk
* generic-service

Example Playbook
----------------

Simple example to install Zeppelin with anonymous connection

```yaml
- hosts: all
  roles:
    - role: zeppelin
      zeppelin_root_dir: /var/lib
```

For production, you must to define users and disable anonymous connection

```yaml
- hosts: servers
  roles:
    - role: zeppelin
      zeppelin_root_dir: /var/lib
      zeppelin_anonymous_login: False
      zeppelin_memory_size_prct: 0.75
      zeppelin_users:
        - name: admin
          password: super_complexe_password
          roles: ['admin'] # role admin exist by default
```

Use with spark and hadoop

```yaml
- hosts: servers
  roles:
    - role: spark
    - role: hadoop
    - role: zeppelin
      zeppelin_spark_home: "{{ spark_install_dir }}"
      zeppelin_hadoop_conf_dir: "{{ hadoop_install_dir }}/etc/hadoop/"
      zeppelin_root_dir: /var/lib
      zeppelin_anonymous_login: False
      zeppelin_memory_size_prct: 0.75
      zeppelin_users:
        - name: admin
          password: super_complexe_password
          roles: ['admin']
```

Note
----

Zeppelin installation can be check by browsing URL **http://serveraddress:9090/**

License
-------

BSD

Author Information
------------------

* Jean-Luc KOFFI <jekof@smile.ci>
* Jean-Vincent KASSI <jekas@smile.ci>
