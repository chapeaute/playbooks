SpagoBI
=========

This role allows you to configure a [SpagoBI](https://www.spagobi.org/) service on your system.

It mainly wraps the generic-service role to ease its use.

Role Variables
--------------

The main variable of this role is `spagobi`. By default, if this variable is not specified, SpagoBI version **5.1** with **OpenJDK 7** will be installed.

Those variables are herited from `generic-service` :

Variable | Default value |Description
---------|---------------|--------------
`subpath` | Mandatory | Contains the name of the top-level directory inside the tar/zip, or the relative path in which the application is already extracted
`source_file` | None | If this parameter is given, a tar/zip file at this path will be copied and extracted to the server
`tmp_dest` | /tmp | Download temporary directory
`source_url` | None | If this parameter is given, a tar/zip file at this path will be downloaded and extracted to the server
`source_checksum` | None | The "ALG:VALUE" checksum, example : sha1:671608f9df6e44e379d78362557b8ec0659145d9
`config_directories`| None | This parameter contains configuration directories that should be copied into the SpagoBI instance

Those variables are specific to this role :

Variable | Default value |Description
---------|---------------|--------------
`needed_libraries` | None | If this parameter is given, the list of libraries URL it contains will be downloaded and add to SpagoBI libraries


Additional variables you can define for this role, outside the `spagobi` one, are :

Variable | Default value |Description
---------|---------------|--------------
`spagobi_service_name` | spagobi | The name you want to give the application. By default it will be used to name the system service and the systems users
`spagobi_java_version` | 7 | The java
version to be installed
`spagobi_root_dir`  | /var/lib | SpagoBI installation dir
`spagobi_java_impl` | openjdk | The java implementation to be installed (possible values: **openjdk** or **oraclejdk**)
| `spagobi_memory_size_prct` | 0.6 | Percentage of total memory allocated |


Requirements
------------

As stated earlier, this role heavily uses the `generic-service` role.

Example Playbook
----------------

Simple example to install SpagoBI 5.1 with OpenJDK version 7 :

```yaml
- hosts: all
  roles:
    - role: spagobi
```

Here is how to quickly bootstrap a new SpagoBI instance:

```yaml
- hosts: servers
  roles:
    - role: spagobi
      spagobi_memory_size_prct: 0.7 # How much percentage of total memory to use ?
      spagobi:
        source_url: http://download.forge.ow2.org/spagobi/All-In-One-SpagoBI-5.2.0_11042016.zip
        source_checksum: sha256:41bbfef494a8dc23032f0cdce7cf70b0d096b6eefb7b2952832711c9fba675a1
        subpath: All-In-One-SpagoBI-5.2.0
        tmp_dest: /var/tmp # Optional, Default /tmp
      spagobi_java_version: 7
```

Note
----

SpagoBI installation can be check by browsing URL **http://serveraddress:8080/SpagoBI/**
And Change the default password.
