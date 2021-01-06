Generic service
===============

This role allows you to configure a generic third-party service on your system.

It includes :

* Creating a user
* Managing permissions
* Managing log files
* Managing init scripts


Role Variables
--------------

The main variable of this role is `genericservice`. It contains a list of the services that you want to run, each service has the following parameters :


Variable | Default value |Description
---------|---------------|--------------
`name` | Mandatory | The name you want to give the application. By default it will be used to name the system service and the systems users
`service_type` | Forking | Define unit file service type
`subpath` | Mandatory | Contains the name of the top-level directory inside the tar/zip, or the relative path in which the application is already extracted
`deploy_method` |  | Method to used to deploy new version of archive. Default, based on archive name. In case archive name is the same between version, you can used checksum to defined if a new version must be deployed. Value can be empty for default or "checksum".
`system_username` | Same as `name` | The name of the user created to run the service
`system_groupname` | Same as `name` | The name of the group created to run the service
`system_home` | None | Optional variable to specify user home dir 
`create_service` | true | Specify if this role should create service 
`source_file` | None | If this parameter is given, a tar/zip file at this path will be copied and extracted to the server
`source_url` | None | If this parameter is given, a tar/zip file at this path will be downloaded and extracted to the server
`source_sha256` | None | This parameter is mandatory if `source_url` has been given. It contains the SHA-256 sum of the downloaded file
`source_checksum` | None | Alternatively, the "ALG:VALUE" checksum, example : `SHA1:671608f9df6e44e379d78362557b8ec0659145d9`
`source_filename` | None | Set this parameter to the archive file name if it cannot be guessed from the URL
`log_glob` | None | If this parameter is given, the corresponding log files will be rotated automatically
`start_command` | None | If this parameter is given, this command will be used to start the service
`start_command_opts` | None | If this parameter is given, add content as start command options in case of environment variables cannot be used
`stop_command_opts` | None | If this parameter is given, add content as stop command options in case of environment variables cannot be used
`stop_command` | None | Mandatory if `start_command` is provided, this command will be used to stop the service
`chowned_dirs` | None | If this parameter is given, it is expected to be a list, and each subdirectory will be chowned to the service user
`needed_packages` | None | If this parameter is given, the list of packages it contains will be installed
`env_vars` | None | If this parameter is given, it must contain a hash of environment variables which will be exported to the service on startup
`limitopenfiles` | None | If this parameter is given, the maximum number of open file descriptors is set to its value
`do_start` | True | Start the generic service at the end of the tasks list (disable it when the service isn't operational until a further role configures and starts it)
`firewall_port` | None | if this parameter is given, add rules on firewall configuration to allowed access to service. Add list of port in format _portnumber/proto_ (example: 8080/tcp)

If neither `source_file` nor `source_url` is given, the role will assume that the application has already been deployed by some external means.

`source_filename`, `log_glob`, `chowned_dirs`, `start_command` and `stop_command` are relative to the path the archive will be extracted into (see examples).

`start_command` or `stop_command` can be relative, in which case they will be anchored to the directory in which the application is deployed, or absolute.

Additional variables you can define for this role, outside the `generic-service` one, are :

Variable | Default value |Description
---------|---------------|--------------
`genericservice_root` | /srv | Path under which the services will be installed


Example Playbook
----------------

Here is how to use the role to install ActiveMQ :

```yaml
- hosts: servers
  vars:
    genericservice:
      name: activemq
      source_url: http://apache.websitebeheerjd.nl/activemq/5.11.1/apache-activemq-5.11.1-bin.tar.gz
      source_checksum: sha256:5ae90f4ea6caa3af7d9f79d1cc55b575dd44170b1451f096494e1a356828d35f
      subpath: apache-activemq-5.11.1
      start_command: bin/activemq start
      stop_command: bin/activemq stop
      log_glob: data/*.log
      chowned_dirs:
        - "data"
        - "tmp"
      needed_packages:
        - openjdk-7-jre
      env_vars:
          JAVA_HOME: /usr/lib/jvm/java-7-openjdk-amd64/jre
      limitopenfiles: 4096

  roles:
     - generic-service
```

If  you want to install multiple services, either use multiple plays, or call the role multiple times with this syntax :

```yaml
- hosts: servers
  roles:
     - role: generic-service
       genericservice:
         name: service1
         etc.
     - role: generic-service
       genericservice:
         name: service2
         etc.
```

License
-------

BSD
