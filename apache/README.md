Apache
=================

This role allows to install the Apache web server and to configure vhosts attached to the server.

Additionally, the role proceeds to some basic useful operations during it's execution :

- disabling the default vhosts shipped with Debian
- set some security settings into /etc/apache2/conf.d/security
- append rows with the localhost address for every vhosts server name and aliases :
```127.0.0.1 www.myservice.com alias1.myservice.com alias2.myservice.com```

You can basically use it by appending the role to your ansible project :

```yml
- hosts : fronts
  roles:
    - apache
```

Requirements
------------

None

Role Variables
--------------

## Available variables

### Global configuration

Variable | Default value |Description
---------|---------------|--------------
`apache2_server_name` | {{ ansible_fqdn }} | Apache2 server name
`apache2_packages` | apache2 | List of packages installed by the role
`apache2_data_dir` | /var/www | Default apache 2 data dir
`apache2_extra_packages` |  | This variable is intended to allow you to append additional packages to be installed from your playbooks without rewriting the whole apache2_packages variable
`apache2_modules`  | headers<br/> deflate <br/> rewrite <br/> ssl<br/> expires | List of apache module enabled by the role.
`apache2_default_stickysession` | JSESSIONID|jsessionid | Default stickysession attribute
`apache2_default_load_balencing_method` | byrequests | Default load balencing method
`apache2_extra_modules` | | This variable is intended to allow you to append additional modules to be enabled from your playbooks without rewriting the whole apache2_modules variable.
`apache2_disabled_default` | default.conf <br/> default_ssl.conf <br/> welcome.conf | List of default website to be disabled
`apache2_user` | www-data | User of the Apache service
`apache2_group`| www-data | Group of the Apache service
`apache2_port`| 80 | Default HTTP port
`apache2_ssl_port`| 443 | Default HTTPs port
`apache2_ssl_ciphers`| HIGH:!aNULL:!eNULL:!kECDH:!aDH:!RC4:!3DES:!CAMELLIA:!MD5:!PSK:!SRP:!KRB5:@STRENGTH | Default SSL ciphers
`apache2_ssl_protocols`| -All +TLSv1.2 | Default SSL protocols
`apache2_version` | *automatic* | This variable is set by ansible automatically. May be useful in vhost template to manage inconsistencies between Apache version and help to keep your playbook generic.
`apache2_enable_caching` | false | Enable cachine of all assets
`apache2_enable_compression` | true | Enable/disable reverse proxy configuration
`apache2_gzip_compression_level` | 6 | Default gzip compression level
`apache2_dontlog_proxy_healthcheck` | true | Disable HAProxy load balancer health check
`apache2_log_x_forwarded_for` | true | Add X-Forwarded-For field to logs file
`apache2_vhost_create_index_file` | true | Create index file in new vhost creation in source directory if no file already exist
`apache2_enable_server_status` | true  | Enable/disable sever-status

### Managing vhosts

You can manage vhost by using the *apache2_vhosts* variable :

```yml
apache2_vhosts:
  my_app_vhost:
    server_name: www.myservice.com
    server_aliases:
      - alias1.myservice.com
      - alias1.myservice.com
  my_other_app_vhost:
    enable_gzip: true
    gzip_compression_level: 6
    vhost_name: name_of_the_vhost
    document_root: /var/www/my_other_app/htdocs
    data_dir: /var/www/my_other_app
    server_name: www.anotherdomain.com
    location_proxies: # Per location proxy
      - name: api
        location: /api
        http_backends:
          - 127.0.0.1:8080
          - 127.0.0.2:8080
```

SSL sample config with rediction to https

```yml
apache2_vhosts:
  my_app_vhost:
    ssl:
      enabled: true  # Enable SSL config
      redirect_to_https: true # Force redirection from http to https
      certificate_file: /etc/httpd/ssl/ssl.crt # Certificate file
      certificate_key_file: /etc/httpd/ssl/ssl.key # Certificate key
    server_name: www.myservice.com
    server_aliases:
      - alias1.myservice.com
      - alias1.myservice.com
```

The following variables are mandatory (except for environment_vars) either set to a default value for each vhosts :

Variable | Default value |Description
---------|---------------|--------------
`data_dir` | /var/www | The website data dir
`document_root` | /var/www/ + server_name + '/htdocs' |The website document_root
`server_name` | | This sets the ServerName directive, by default, its value is the hash Key
`directives` | | An optional list of additional directives for configuration
`server_aliases` | | An optional list of additional domain we can build a list of ServerAlias directives with
`enable_gzip` | `apache2_enable_gzip` | Enable gzip per vhost
`gzip_compression_level` | `apache2_gzip_compression_level` | Specify gzip compression level
environment_vars | | An optional dictionary containing environment variables names as keys, and their values
`vhost_name` | The same value as the key of the vhost into apache2_vhosts dictionary| Allow to keep control on the name of the file containing the vhost. By example you can inject the environment name into the filename. So the resulting file will be called **my_app_vhost_dev.conf** instead of **my_app_vhost.conf**.
`location_proxies` | [] | Define location based proxy
`location_proxies.name`  |  | Location name
`location_proxies.location`  |  | Location of apache
`location_proxies.http_backends` | | Proxy of apache http
`location_proxies.load_balencing_method` | byrequests | Define proxy load balencing method
`location_proxies.stickysession` | | Define proxy stickysession attribute



## Using PHP

If you intend on using PHP, the [php role](https://git.smile.fr/ansible/ansible-php) should take care of the necessary configuration, however, if you need to put PHP-specific configuration in your VHost files, you might need to add PHP to the `apache2_modules` list:

```yml
apache2_modules:
  - headers
  - deflate
  - rewrite
  - ssl
  - expires
  - php5
```

## Available tags

* **install** :  Run everything. Only present since some playbook uses it.
* **update_config** :  Run everything except the vhosts installation / configuration.
* **update_app** : Run every tasks related to vhosts. Additionally new packages and modules are installed and configured since they may be required by the vhosts

## Available handlers

This role provides an handler which restart Apache. You can use it in your own task through :

```yml
- hosts : fronts
  tasks:
    - name: "Useless task that will restart Apache on changed"
      debug: msg="My super dumb task"
      notify: "Restart Apache"
  roles:
    - role: apache
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

```
molecule verify # lint role
molecule check # dry run
molecule test # launch test from scracth
```

Docs on testing:
https://molecule.readthedocs.io
