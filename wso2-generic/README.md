WSO2 Generic
===========

This role allows you to install and configure any wso2 server
It mainly wraps the generic-service role to ease its use.

Requirements
------------

Host required at least 1 Go of RAM.

Role Variables
--------------

The main variable of this role is `wso2_generic`. By default, if this variable is not specified, wso2_generic version **5.9.0** with **OpenJDK 8** will be installed.

Those variables are herited from `generic-service` :

Variable | Default value | Description
---------|---------------|--------------
`subpath` | Mandatory | Contains the name of the top-level directory inside the tar/zip, or the relative path in which the application is already extracted
`source_file` | None | If this parameter is given, a tar/zip file at this path will be copied and extracted to the server
`tmp_dest` | /tmp | Download temporary directory
`source_url` | None | If this parameter is given, a tar/zip file at this path will be downloaded and extracted to the server
`source_checksum` | None | The "ALG:VALUE" checksum, example : sha1:671608f9df6e44e379d78362557b8ec0659145d9
`config_directories`| None | This parameter contains configuration directories that should be copied into the wso2_generic instance

Additional variables you can define for this role, outside the `wso2_generic` one, are :

| Variable | Default value | MySQL variable |
| ---------|---------------|---------------- |
| `wso2_generic_root_dir` | /var/lib | Installation dir of wso2 |
| `wso2_generic_memory_size_prct` | 0.6 | Percentage of total memory allocated
| `wso2_generic_java_opts` | "" | Add java variables
| `wso2_generic_logs_rotate` | 7 | Rotate logs for 7 days

Dependencies
------------

* **openjdk**

License
-------

BSD

Author Information
------------------

* jekas@smile.ci <jean.kassi@smile.ci>
