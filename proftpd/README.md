PROFPTD
=========

This module install and configure proftpd with mod sftp

Requirements
------------

**This module does not yet work with selinux**

Dependencies
------------

None

Role Variables
--------------

The variables that can be passed to this role and a brief description about them are as follows:

| Variable | Default value | Description |
| ---------|---------------|---------------- |
| `proftpd_auth_user_file` | /etc/proftpd/proftpd.password | Proftpd auth user file |
| `proftpd_max_instances` | 30 | proftpd max instances |
| `proftpd_log_dir` | false | Enable pam login |
| `proftpd_enable_pam` | false | Enable pam login |
| `proftpd_enable_sftp` | true | Enable sftp login |
| `proftpd_enable_ftp` | false | Enable ftp login |
| `proftpd_home_dir` | /var/www | Default proftpd home dir |
| `proftpd_user_shell` | /sbin/nologin | Default proftpd user shell |
| `proftpd_sftp_auth_methods` | password | list of sftp authentication methods |
| `proftpd_ftp_port` | 21 | 21 port |
| `proftpd_sftp_port` | 2222 | sftp port |
| `proftpd_users` | [] | List of profptd users |
| `proftpd_users.name` |  | Name of proftpd user |
| `proftpd_users.state` |  | Set state of proftpd user |
| `proftpd_users.password` | | User password  |
| `proftpd_users.home_dir` | `proftpd_home_dir` | User home dir |
| `proftpd_users.shell` | `proftpd_user_shell` | User shell |
| `proftpd_users.user_id` | `48` | Map user id to apache user id  |
| `proftpd_users.group_id` | `48` | Map group id to apache group id |

Example Playbook
----------------

```
- hosts: servers
  roles:
     - role: proftpd
       proftpd_enable_sftp: True
       proftpd_sftp_port: 22222 # Port of SFTP
       proftpd_users:
         - name: test
           password: complexepassword # Password is encrypted after
           home_dir: /var/www
           user_id: 48  # Map user id to apache user id centos
           group_id: 48 # Map group id to apache group id centos
```

Tester avec cette commande

```
sftp -P2222 test@IP
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

```
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