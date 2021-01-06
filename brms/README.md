BRMS
=========

This role allows you to configure a [Red Hat JBoss BRMS] service on your system. Red Hat JBoss BRMS is the enterprise product for mission critical releases, with a multi year commitment for backport of fixes, based off a sanitised community release of Drools.

This role mainly wraps the generic-service role to ease its use.

Role Variables
--------------

The main variable of this role is `brms`.

Those variables are herited from `generic-service` :

Variable | Default value |Description
---------|---------------|--------------
`subpath` | Mandatory | Contains the name of the top-level directory inside the tar/zip, or the relative path in which the application is already extracted
`source_file` | None | If this parameter is given, a tar/zip file at this path will be copied and extracted to the server
`source_url` | None | If this parameter is given, a tar/zip file at this path will be downloaded and extracted to the server
`source_checksum` | None | The "ALG:VALUE" checksum, example : sha1:671608f9df6e44e379d78362557b8ec0659145d9
`config_directories`| None | This parameter contains configuration directories that should be copied into the SpagoBI instance
`brms_heap_size_prct` | 0.85 | Pourcentage of RAM available on server allocated to JVM Heap Size
`brms_heap_size` | 85% of RAM | JVM Heap Size. Automatically calculated from `brms_heap_size_prct`
`brms_heap_size_xms` | 80% of Xmx | JVM Xms Size. Automatically calculated from `brms_heap_size`
`brms_heap_size_xmx` | 85% of RAM | JVM Xmx Size. Automatically calculated from `brms_heap_size`

Those variables are specific to this role :

Variable | Default value |Description
---------|---------------|--------------
`needed_libraries` | None | If this parameter is given, the list of libraries URL it contains will be downloaded and add to BRMS libraries


Additional variables you can define for this role, outside the `brms` one, are :

Variable | Default value |Description
---------|---------------|--------------
`brms_service_name` | brms | The name you want to give the application. By default it will be used to name the system service and the systems users
`brms_java_version` | 8 | The java version to be installed
`brms_java_impl` | openjdk | The java implementation to be installed (possible values: **openjdk** or **oraclejdk**)
`brms_dir` | /var/lib | The default home directory of brms service
`brms_user` | brms | The default username of the brms for accesing business-central.
`brms_password` | P@ssw0rd | The default password of the brms user for accesing business-central. This password should be more complex or changed before production. It must be at least eight characters long, with one alphabetic character, one digit, and one non-alphanumeric character

Requirements
------------

As stated earlier, this role heavily uses the `generic-service` role.

Example Playbook
----------------

Simple example to install JBoss BRMS 6.4 with openjdk version 8 :

```yaml
- hosts: all
  roles:
    - role: brms
```

Here is how to quickly bootstrap a new BRMS instance with a particular Heap Size :

```yaml
- hosts: servers
  roles:
    - role: brms
      brms:
        source_url: http://archive.smile.ci/jboss-brms-6.4-all-in-one.tar.gz
        source_checksum: sha256:41bbfef494a8dc23032f0cdce7cf70b0d096b6eefb7b2952832711c9fba675a1
        subpath: jboss-brms-6.4-all-in-one
      brms_java_version: 8
      brms_heap_size_prct: 0.6
```

Note
----

Red Hat JBoss BRMS installation can be check by browsing URL **http://hostname:8080/business-central/** and change the default password.
