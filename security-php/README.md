Security PHP
=========

This role secure a php server

Requirements
------------

* Apache
* PHP

Role Variables
--------------

| `php_display_errors` |  Off | Disable php display errors |
| `php_log_errors` |  On | Log php errors
| `php_file_uploads` |  On | Enable file uploads |
| `php_upload_max_filesize` |  100M | Set max file size
| `php_post_max_size` |  100M | Set max post payload size
| `php_allow_url_fopen` |  On | Allow url open |
| `php_allow_url_include` |  On | Allow url include
| `php_always_populate_raw_post_data` |  '-1' |
| `php_session_gc_maxlifetime` |  1 |
| `php_session_gc_divisor` |  100 |
| `php_date_timezone` |  'Africa/Abidjan' |
| `php_memory_limit` |  '512M' |
| `php_disable_functions` |  'exec, shell_exec, system, passthru, phpinfo,show_source, popen, filepro, filepro_rowcount, filepro_retrieve, posix_mkfifo, fopen_with_path, dbmopen, dbase_open'

Dependencies
------------

* None

Example Playbook
----------------

```yml

- hosts: all
  roles:
    - role: security-php

```

License
-------

BSD

Author Information
------------------

* Sebastien Gireaud <segir@smile.ci>
* Jean-Vincent KASSI <jekas@smile.ci>
