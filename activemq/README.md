ActiveMQ
=========

This role allows you to configure a Activemq service on your system.

It mainly wraps the generic-service role to ease its use.

Requirements
------------

Host required at least 1 Go of RAM.

Role Variables
--------------

The main variable of this role is `Activemq`. By default, if this variable is not specified, Activemq version **5.9.0** with **OpenJDK 8** will be installed.

Those variables are herited from `generic-service` :

Variable | Default value |Description
---------|---------------|--------------
`subpath` | Mandatory | Contains the name of the top-level directory inside the tar/zip, or the relative path in which the application is already extracted
`source_file` | None | If this parameter is given, a tar/zip file at this path will be copied and extracted to the server
`tmp_dest` | /tmp | Download temporary directory
`source_url` | None | If this parameter is given, a tar/zip file at this path will be downloaded and extracted to the server
`source_checksum` | None | The "ALG:VALUE" checksum, example : sha1:671608f9df6e44e379d78362557b8ec0659145d9
`config_directories`| None | This parameter contains configuration directories that should be copied into the activemq instance

Additional variables you can define for this role, outside the `activemq` one, are :

Variable | Default value |Description
---------|---------------|--------------
`activemq_service_name` | activemq | The name you want to give the application. By default it will be used to name the system service and the systems users
version to be installed
`activemq_root_dir`  | /var/lib | activemq installation dir
| `activemq_memory_size_prct` | 0.6 | Percentage of total memory allocated |
| `activemq_admin_login` | admin | Administrator login
| `activemq_admin_pass`  | *generated* | Adminstrator password
| `activmq_jmx_enabled` | true | Enable jmx interface
| `activmq_jmx_port`  |  1099 | JMX interface Port

Dependencies
------------

This role depends on:

* generic-server
* zookeeper

Example Playbook
----------------

Here is how to quickly bootstrap a new activemq instance:

```yaml
- hosts: all
  roles:
    - role: activemq
```

Cluster mode

```yaml
- hosts: servers
  roles:
    - role: activemq
      zk_data_dir: /srv/zookeeper # change data dir
      activemq_root_dir: /srv # change data dir

```

Note
----

ActiveMQ installation can be check by browsing URL **http://serveraddress:8161/hawtio**

License
-------

BSD

Author Information
------------------

* Jean-Luc KOFFI <jekof@smile.ci>
* Jean-Vincent KASSI <jekas@smile.ci>
