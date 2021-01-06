Security Mariadb
=========

This role secure a Mysql or MariaDB deployment

Requirements
------------

* **Mariadb**

Role Variables
--------------

| Variable` | Default value | Description |
| ---------|---------------|---------------- |
| `manage_by_cluster` | false | If true don't automatically restart mariadb
| `security_level` | 1 | Security level of configuruation |
| `security_mariadb_history` | true | Link
| `security_mariadb_files_permissions` | true
| `security_mariadb_config` | true |
| `mysql_data_dir` | /var/lib/mysql |
| `mysql_conf_cis` | /etc/my.cnf.d/99-cis.cnf |
| `security_mariadb_password_check` | false | Enabe password check policy
| `security_mariadb_password_minimal_digits` | 4 | Minimal number of digits in password
| `security_mariadb_password_minimal_special_chars` | 4 | Minimal number of special chars in password
| `security_mariadb_password_minimal_same_case` | 4 | Minimal required number of letters of the same letter case
| `security_mariadb_password_minimal_length` | 32 | Minimal password length
| `security_mariadb_ssl` | false | Enable SSL connection to mysql |
| `security_mariadb_ssl_require` | false | Require SSL to connect database
| `security_mariadb_ssl_cert_path` | `{{ ssl_certs_cert_path}}` | Certificate file to use
| `security_mariadb_ssl_key_path` |  `{{ssl_certs_privkey_path}}` | Certificate key to use

Dependencies
------------

* noneq

Example Playbook
----------------

```yml
- hosts: mariadb
 roles:
  - role: security-mariadb
    security_level: 2
    security_mariadb__password_check: false # True to enable password check
    security_mariadb_ssl: true # True to enable ssl connections
```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
