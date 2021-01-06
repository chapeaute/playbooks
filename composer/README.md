Composer
=========

Installs Composer, the PHP Dependency Manager, on any Linux or UNIX system.

Requirements
----------------

* **php**

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| composer_version | 1.9.3 | install a specific release of Composer |
| composer_keep_updated | false | Instal latest version

## Dependencies

* php

## Example Playbook

```yml
    - hosts: all
      roles:
        - php
        - composer
```

After the playbook runs, `composer` will be placed in `/usr/local/bin/composer` (this location is configurable), and will be accessible via normal system accounts.

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
