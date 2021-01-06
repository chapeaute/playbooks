Solr
=========

This role allows you to configure a [Solr](http://lucene.apache.org/solr/) service on your system.

It mainly wraps the generic-service role to ease its use.

Role Variables
--------------

The main variable of this role is `solr`.

Those variables are herited from `generic-service` :

Variable | Default value |Description
---------|---------------|--------------
`subpath` | Mandatory | Contains the name of the top-level directory inside the tar/zip, or the relative path in which the application is already extracted
`source_file` | None | If this parameter is given, a tar/zip file at this path will be copied and extracted to the server
`source_url` | None | If this parameter is given, a tar/zip file at this path will be downloaded and extracted to the server
`source_checksum` | None | The "ALG:VALUE" checksum, example : sha1:671608f9df6e44e379d78362557b8ec0659145d9
`config_directories`| None | This parameter contains configuration directories that should be copied into the Solr instance

Those variables are specific to this role :

Variable | Default value |Description
---------|---------------|--------------
`needed_libraries` | None | If this parameter is given, the list of libraries URL it contains will be downloaded and add to Solr libraries


Additional variables you can define for this role, outside the `solr` one, are :

Variable | Default value |Description
---------|---------------|--------------
`solr_service_name` | solr | The name you want to give the application. By default it will be used to name the system service and the systems users
`solr_java_version` | 7 | The java version to be installed
`solr_java_impl` | openjdk | The java implementation to be installed (possible values: **openjdk** or **oraclejdk**)

Requirements
------------

As stated earlier, this role heavily uses the `generic-service` role.

```yaml
- src: git@git.smile.fr:ansible/generic-service.git
  scm: git
- src: git@git.smile.fr:ansible/solr.git
  scm: git
```

Example Playbook
----------------

Simple example to install Solr 5.2.1 with openjdk version 7 :
```yaml
- hosts: all
  roles:
    - role: solr
```

Here is how to quickly bootstrap a new Solr instance:

```yaml
- hosts: servers
  roles:
    - role: solr
      solr:
        source_url: http://www-eu.apache.org/dist/lucene/solr/6.3.0/solr-6.3.0.tgz
        source_checksum: sha1:8e11c1d7af0ac516f6a2e7e1a486d216cc9944b8
        subpath: solr-6.3.0
        needed_libraries:
          - http://search.maven.org/remotecontent?filepath=mysql/mysql-connector-java/5.1.26/mysql-connector-java-5.1.26.jar
      solr_java_version: 8
```

Note
----

For SolR 4.X, the example folder is copied in the server folder in which the solr service will be executed.

Solr installation can be check by browsing URL **http://serveraddress:8983/solr/**

License
-------

BSD
