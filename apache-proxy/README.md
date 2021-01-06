Apache Proxy
=================

This role install and configure Apache with modsecurity2 plugins installed
and install crs rules

Requirements
------------

None

Role Variables
--------------

## Global configuration

Variable | Default value |Description
---------|---------------|--------------
apache2_modsecurity_default_mode | Off | Default modsecurity mode |
apache2_default_load_balencing_method | byrequests | Default apache load balencing method (byrequests,bytraffic,bybusyness) |
apache2_proxy_timeout | 120 | Amount of time the server will wait for certain events before failing a request
apache2_default_stickysession | PHPSESSID | Default apache sticky session cookie |

For using this role as default a WAF just switch apache2_modsecurity_default_mode to DectionOnly Or On

## Managing Proxies

You can manage vhost by using the *apache2_proxies* variables.
Example

```yml
apache2_proxies:
  www.smile.ci:
    server_aliases:
      - www.smile.ci
      - smile.ci
    http_backends:
      - 195.154.89.84
```

The following variables are mandatory (except for environment_vars) either set to a default value for each vhosts :

Variable | Default value |Description
---------|---------------|--------------
port     |       80        | Default public proxy port
server_aliases | [] | An optional list of additional domain we can build a list of ServerAlias directives with
http_backends | [] | A  list of http backend servers
http_backends_port | 80 | Proxy port for every backend
http_backends_options | '' | Proxy option to use for every backend
modsecurity_mode | {{ apache2_modsecurity_default_mode }}  | Define modsecurity mode (On,Off,DetectionOnly)
stickysession | | Proxy loadbalencer stickyession cookie
load_balencing_method | {{ apache2_default_load_balencing_method }} | Proxy load balencing method |

Dependencies
------------

This module depends on the apache module:

* apache

Example Playbook
----------------

Simple apache-proxy

```yml
- name: Deploy apache proxy
  roles:
    - role: apache-proxy
      apache2_proxies:
        google.com:
          server_aliases:
            - www.google.com
          http_backends:
            - 64.233.167.100
            - 64.233.167.101
```

Apache-proxy with modsecurity

```yml
- name: Deploy apache with modsecurity WAF
  roles:
    - role: apache-proxy
      apache2_modsecurity_default_mode: DectionOnly # uncomment to enable WAF
      apache2_proxies:
        google.com:
          server_aliases:
            - www.google.com
          http_backends:
            - 64.233.167.100
            - 64.233.167.101
```

SSL sample config with rediction to https

```yml
apache2_proxies:
  my_app_vhost:
    ssl:
      enabled: true  # Enable SSL config
      redirect_to_https: true # Force redirection from http to https
      certificate_file: /etc/httpd/ssl/ssl.crt # Certificate file
      certificate_key_file: /etc/httpd/ssl/ssl.key # Certificate key
      certificate_chain_file: /etc/httpd/ssl/ca.bundle # Certificate chain
    server_name: www.myservice.com
    server_aliases:
      - alias1.myservice.com
      - alias1.myservice.com
```

Enable per location proxy

```yml
apache2_proxies:
  my_other_app_vhost:
    http_bacekends_port: 80 # By default 80
    http_backends: "{{ groups['apache'] }}"
    location_proxies: # Per location proxy
      - name: api
        location: /api
        http_backends_port: 8080
        http_backends: "{{ groups['tomcat'] }}"
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
molecule verify # lint role
molecule check # dry run
molecule test # launch test from scracth
# You can relaunch test after with existing instances
ansible-playbook playbook
```

Docs on testing:
https://molecule.readthedocs.io

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>