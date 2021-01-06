Basic server
============

This role describes a basic server, and contains all Smile best practices with regards to locales, default packages, shell and editor config

Requirements
------------

None.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `default_locale` | en_US.UTF-8 | Default locale |
| `rootpromptcolor` | red | Prompt color root user |
| `userpromptcolor` | green | Prompt color default user |
| `promptsite_tag` | NULL | Site information to display in prompt |
| `promptsite_sep` | "#" | Prompt separator |
| `users_groups` | [] | List of groups to create |
| `user_default_shell`| /bin/bash | Default user shell |
| `yum_disabled_plugins` | ['fastestmirror'] | Disable yum plugins |
| `yum_enabled_plugins` | [] | Enable yum plugins |
| `users` | [] | List of users to create |
| `users.sshkeys` | [] | List of sshkeys of users to deploy |
| `extra_packages` | [] | Array of packages to install on the system |
| `extra_remove_packages` | [] | Array of packages to remove on the system |
| `install_epel` | true | Enable EPEL repository on RedHat family |
| `root_password` |  | Set root password in crypt form with following command **mkpasswd --method=sha-512** |
| `install_sudoers` | true | Deploy sudoers |
| `manage_locales` | true | Manage locales
| `manage_firewalld` | true | Ensure firewalld is installed, enabled and started |
| `disable_network_manager` | false | Ensure NetworkManager is removed and systemd-netowrkd is enabled and started |
| `historytime_format` | '%Y/%m/%d - %H:%M:%S ' | Configure default history time format
| `manage_hostname` | true | Update /etc/hosts by adding entry with default IP address |
| `remove_loopback_hostname_entry` | true | Remove 127.0.0.1 entry associated to host name fqdn (i.e 127.0.0.1.*hostname.fqdn)  |
| `sudo_lines`   | [] | Array of sudo lines to deploy on the server |
| `copy_admin_scripts` | false | Deploy powerfull admin scripts |
| `service_disabled` | [] | List to service to stopped and disabled at boot |
| `main_interface` | ansible_default_ipv4.interface | Default main interface | | `update_all_packages` | false | Upgrade all installed packages |


DNS options :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `dns_search` | [] | Array of search domain |
| `dns_servers` | ['8.8.8.8'] | Array of dns servers |
| `dns_domain` | NULL | Dns domain of the server |

SSH options :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `ssh_enable_passwd_auth` | yes | Enable/disable password authentication |
| `ssh_enable_root_login` | yes | Enable/disable root login  |
| `ssh_use_dns` | yes | Enable/disable DNS resolution |

ATOP options :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `atop_enable` | yes | Enable/disable atop installation |
| `atop_interval` | 600 | Log interval |
| `atop_retention_day` | 21 | Logs retention |

Logrotate options :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `logrotate_enable` | true | Enable/disable logrotate installation and specific configuration |
| `logrotate_compress` | true | Enable/disable logrotate compression |

/etc/hosts entry :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `hosts_entry.ip` |  | Host IP address |
| `hosts_entry.fqdn` | | Host Fully Qualify Domain Name |
| `hosts_entry.hostname` | | Host name |


Sample playbooks
---------------

Deploy configuration with epel-release installed as an extra package

```
- hosts: all
  roles:
    - role: basicserver
      extra_packages:
        - epel-release
```

Create users and groups


```
- hosts: all
  vars:
    lookup_ldapkey_url: "ldaps://directory.vitry.intranet/ou=users,dc=smile,dc=fr?sshPublicKey?sub?(&(!(pwdAccountLockedTime=000001010000Z))(uid=%s))"\
    lookup_ldapkey_binddn: "cn=admin,dc=smile,dc=fr"
    lookup_ldapkey_bindpw: "password"
  roles:
    - role: basicserver
      users_groups:
        - name: exploit
      users:
        - name: jekas
          groups: exploit
          sshkeys:
            - "{{ lookup('ldapkey', 'jekas') }}"
```

Prompt configuration
--------------------

The following variable allows you to alter the default prompt (light green) :

* `rootpromptcolor: red`

You can choose the prompt color among ANSI colors : black, red, green, yellow, blue, magenta, cyan, white

Install additionnal packages
----------------------------

The following variable allows you to install additionnal packages :

* `extra_packages`

It takes a list of packages to install

Sudoers configuration
---------------------

The following variables allow you to configure sudo on your server :

* `install_sudoers`: set it to `true` to install a sudoers file
* `sudo_lines`:  list of users the `smile` user can impersonate without password


Create Groups
------------

```
users_groups:
  - name: exploit
    state: present # default
```

Create Users
--------------

You can ask the script to create a list of users for your applications

```
users:
  - name: smile
    group: www-data
    sshkey:
      - "{{ lookup('file', 'user1.pub') }}"
      - "{{ lookup('ldapkey', 'mabes') }}"
```

`authorized_keys` is not mandatory, if present, you should give it a list of SSH keys that should be enabled for the user

SSH Key LDAP lookups
--------------------

This role adds a new lookup plugin called `ldapkey`, you can use it to lookup SSH keys by login from the Smile LDAP.
In order to use this feature, you need to install `python-ldap` on the machine running Ansible
Anywhere in your playbook, you can use :

```
{{ lookup('ldapkey', 'login') }}
```


Or you can use it in tasks

```
- authorized_key: user=charlie key="{{ item }}"
  with_ldapkey:
    - mabes
    - rogon
```

### Configuration (optional)

By default, it will fetch keys from `directory.vitry.intranet`. If this server isn't accessible to you, of if you want to change some parameters, you can define the URL yourself :

```
    vars:
        lookup_ldapkey_url: ldaps://ldap.prod.vitry.intranet/
```

The `lookup_ldapkey_url` takes a RFC4516 LDAP URL.

You may also override the search filter, base DN, scope, or return attribute

```
    vars:
        lookup_ldapkey_url: "ldaps://directory.vitry.intranet/ou=users,dc=smile,dc=fr?sshPublicKey?sub?(&(!(pwdAccountLockedTime=000001010000Z))(uid=%s))"\
        lookup_ldapkey_binddn: "cn=admin,dc=smile,dc=fr"
        lookup_ldapkey_bindpw: "password"
```

`%s` in the search filter will be replaced by the lookup key
