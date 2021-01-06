Generic WebApp
=========

This role allows you to configure a generic web app on your system.
It includes:

* Downloading and decompress the webapp
* Manage the permissions
* Create symlink

This role serve as an "alias" for the role ansistrano.

Requirements
------------

None

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

## General variables

| Name | Default | Description |
|------|---------|-------------|
| generic_webapp_name | | Name of the virtual host
| generic_webapp_url | |  Download url webapp
| generic_webapp_current_via | symlink | How to deploy the application
| generic_webapp_deploy_via | download_unarchive |
| generic_webapp_root_dir | /var/www | Where to to deploy the application
| generic_webapp_release_dir | release | Release dir
| generic_webapp_htdocs_dir | htdocs | Directories where sources are stored
| generic_webapp_rw_dirs | []  | Directories that must be writable
| generic_webapp_rw_files | [] | Files that must be writable
| generic_webapp_owner | apache | User owner of the files and directories
| generic_webapp_group | apache | Group owner of the files and directories
| generic_webapp_keep_releases | 1 |   Releases to keep after a new deployment

## Database provisioning

| Name | Default | Description |
|------|---------|-------------|
| generic_webapp_db_backend | mariadb | backend db type (only mysql is supported for now )
| generic_webapp_db_host | 127.0.0.1 | db host
| generic_webapp_db_name | | db name
| generic_webapp_db_user | generic | db user
| generic_webapp_db_pass | *generated* | Password id generated

Dependencies
------------

* mysql-provider
* postgresql-provider
* ansistrano

Example Playbook
----------------

```yml
- hosts: webapp
  roles:
    - role: generic-webapp
      generic_webapp_fqdn: www.site.ci
      generic_webapp_aliases: [site.ci]
      generic_webapp_deploy_via: "download_unarchive"
      generic_webapp_root_dir: "/srv/www"
      generic_webapp_url: "http://site/downoad.tar.gz"
      generic_webapp_rw_dirs: []
      generic_webapp_rw_files: []
      generic_webapp_db_host: "mariadb"
      generic_webapp_db_name: "webapp"
      generic_webapp_db_user: "webapp"
```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
