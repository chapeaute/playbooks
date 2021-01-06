Drupal
=======

This role deploy Apache and php for a drupal install

Requirements
------------

* None

Role Variables
--------------

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `drupal_php_version` | "7.2" | Verson of php to install |
| `drupal_php_extensions` | [] | List of php extensions to install |
| `drupal_php_memory_prct` | 0.4 | Percentage of memory to use for php |
| `drupal_php_max_execution` | 120 | PHP max execution time |
| `drupal_site_name` | | Name of the drupal web site
| `drupal_site_aliases` | [] | Site aliases
| `drupal_site_dir` | /var/www | Apache data dir
| `drupal_ssl_enabled` false | Enable SSL
| `drupal_ssl_key_file` | "{{ apache2_default_ssl_key }}" | Cerficate key file
| `drupal_ssl_cert_file` | "{{ apache2_default_ssl_key }}" | Certificate file
| `drupal_ssl_redirect` | true | Redirect HTTP to HTTPS

Dependencies
------------

* php
* composer
* apache

Example Playbook
----------------

Sample playbook

```yml

- name: drupal
  roles:
    - role: drupal
      drupal_site_dir: /srv/www
      drupal_site_name: monsite.ci
      # drupal_ssl_enabled: true
```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
