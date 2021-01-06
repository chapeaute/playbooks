PHP
=====

Install php, extra php packages and settings

Requirements
------------

None

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

Variable | Default value |Description
---------|---------------|------------
`php_use_default_package`  | True | Use default version of php
`php_version`  | "5.6" | Default php version to install, can be 5.7,7.0,7.1 . This option is not used if `php_use_default_package` is True
`php_packages` | *Depends on distribution* | What PHP packages will be installed
`php_extension_packages`| | The PHP extensions installed packages. You should override in your playbook vars to enable some additional extensions
`php_extensions`| [] | List of extensions to install
`php_extra_extensions`| [] | List of additionnal extensions to install
`php_extras_packages`| | This variable is present to allows installing extension only on some environment basis by overriding it into the inventory vars. By example, you should use it to enable xhprof and xdebug only in the dev environment.
`php_settings_all`| | PHP configuration variables to set for both CLI and Apache2
`php_settings_cli`| | PHP configuration variables to set only for CLI (Debian Only)
`php_settings_apache2`| | PHP configuration variables to set only for Apache2 (Debian Only)

Dependencies
------------

None

Sample playbooks
---------------

## Basic usage

You can basically use it by appending the role to your ansible project :

```yml
- hosts : fronts
  roles:
    - role: php
```
Install default php modules :

```yml
- hosts : fronts
  roles:
    - role: php
      php_use_default_package: False
      php_default_version: 5.6
      php_extensions:
        - gd
        - devel
        - intl
        - mbstring
        - mcrypt
        - mysql
        - opcache
        - pdo
        - xml
```

## Available variables

You can modifiy php values

```YAML
---
php_default_settings_all:
        max_input_time: 60
        expose_php: Off
        display_errors: Off
        error_reporting: "E_ALL & ~E_DEPRECATED & ~E_STRICT"
        log_errors: On
        error_log:

php_default_settings_cli:
        memory_limit: 512M
        max_execution_time: 1200

php_default_settings_apache2:
        memory_limit: 128M
        max_execution_time: 120
```

## Available tags

This role has no special tags management. Classical tags have been added to the role and allows the role to be compatible with playbooks that are using them :

* **install**
* **update_config**
* **update_app**

## Available handlers

This role does not provides any handler.
