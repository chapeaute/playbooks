New Relic PHP Aagent
=========

Install NewRelic php agent

Requirements
------------

The server must have installed

* php
* apache

Role Variables
--------------


| Variable                 | Default value          | Description          |
| -------------------------|------------------------|---------------------|
| newrelic_php_license     |                        | Sets the New Relic license key to use.  |
| newrelic_php_logdir      |  /var/log/newrlic      | Log directory |
| newrelic_php_appname     | PHP APPLICATION        | New Relic PHP AppName |
| newrelic_php_logfile     |  /var/log/httpd/php_agent.log   | php agent log file
| newrelic_php_daemon_logfile     |  /var/log/httpd/newrelic-daemon.log   | newrelic daemon logfile |

Dependencies
------------

* newrelic-daemon

Example Playbook
----------------

```yml

- hosts: all
  roles:
    - role: apache
    - role: php
    - role: newrelic-php-agent
      newrelic_php_license: REPLACE_LICENSE KEY
      newrelic_php_appname: MY_APP_NAME

```

License
-------

BSD

Author Information
------------------

* Jean-Vincenet KASSI <jekas@smile.ci>
