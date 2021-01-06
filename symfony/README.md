Symfony
=======

This role deploy Apache and php for a symfony install

Requirements
------------

* None

Role Variables
--------------

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `symfony_php_version` | "7.2" | Verson of php to install |
| `symfony_php_extensions` | [] | List of php extensions to install |
| `symfony_php_memory_prct` | 0.4 | Percentage of memory to use for php |
| `symfony_php_max_execution` | 120 | PHP max execution time |
| `symfony_site_name` | | Name of the symfony web site
| `symfony_site_aliases` | [] | Site aliases
| `symfony_site_dir` | /var/www | Apache data dir
| `symfony_ssl_enabled` false | Enable SSL
| `symfony_ssl_key_file` | "{{ apache2_default_ssl_key }}" | Cerficate key file
| `symfony_ssl_cert_file` | "{{ apache2_default_ssl_key }}" | Certificate file
| `symfony_ssl_redirect` | true | Redirect HTTP to HTTPS

Dependencies
------------

* php
* composer
* apache

Example Playbook
----------------

Sample playbook

```yml

- name: symfony
  roles:
    - role: symfony
      symfony_site_dir: /srv/www
      symfony_site_name: monsite.ci
      # symfony_ssl_enabled: true
```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
