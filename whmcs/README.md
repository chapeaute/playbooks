WHMCS
=========

Install WHMCS

Role Variables
--------------

WHMCS parameters :

Variables            |  Default value      |  Description                          |
---------------------|:-------------------:| -------------------------------------:|
`whmcs_version` | 7.10.2 | WHMCS version (Attention: version must be download before in https://www.whmcs.com/download/ and put in archive.smile.ci/whmcs/ directory)
`whmcs_admin_email` | admin@smile.ci | WHMCS admin email
`whmcs_admin_pass` | changeme | WHMCS admin password
`whmcs_licence_key` | WHMCS-xxxxxxxxxxxxxxx | WHMCS Lience
`whmcs_cc_encryption_hash` | `auto-generate` | WHMCS credit card encryption hash

Web server parameters :

Variables            |  Default value      |  Description                          |
---------------------|:-------------------:| -------------------------------------:|
`whmcs_vhost` | whmcs | WHMCS vhost
`whmcs_aliases` | [] | WHMCS vhost aliases
`whmcs_webroot_dir` | /var/www | Web server root dir
`whmcs_htdocs_dir` | `whmcs_webroot_dir`/`whmcs_vhost`/htdocs | WHMCS document root

Database parameters :

Variables            |  Default value      |  Description                          |
---------------------|:-------------------:| -------------------------------------:|
`whmcs_db_host`| localhost | Databases host address used by WHMCS to access his data
`whmcs_db_remote_host`| `inventory_hostname` | Databases ansible inventory host address used by ansible to provision user and databse information before deploying WHMCS
`whmcs_db_username`| whmcs | WHMCS databases username
`whmcs_db_password`| `auto-generated` | WHMCS databases password
`whmcs_db_name`| whmcs | WHMCS databases name

Admin login URL : http://{{ whmcs_vhost }}/admin

Dependencies
------------

* apache
* generic-webapp
* php
* ioncube

Example Playbook
----------------

```
- hosts: servers
  roles:
   - role: mariadb-server
   - role: whmcs
```

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
- hosts: servers
  vars:
    whmcs_vhost: whmcs.smile.ci
    whmcs_admin_email: admin@smile.ci
    whmcs_admin_pass: changeme
    whmcs_licence_key: 'WHMCS-xxxxxxxxxxx'
  roles:
    - role: mariadb-server
    - role: whmcs
```

Testing
--------

Launch the test

```bash
pip install molecule molecule[docker]
molecule test
```

Docs on testing:
https://molecule.readthedocs.io


License
-------

BSD

Author Information
------------------

* Franck ABOA <franck.aboa@smile.ci>
