Role Name
=========

This role install and configure FreeIPA server.

Requirements
------------

Host must have your host name fully qualified.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

Variable | Default value | Description
-------- | ------------- | -----------
`freeipa_domain` | example.lan  | Domain name
`freeipa_realm` | `freeipa_domain \| upper`  | REALM name
`freeipa_hosts` | [`ansible_fqdn`] | FreeIPA hosts list. All hosts in this will be configure as FreeIPA cluster
`freeipa_cluster_name` | freeipa\_cluster | Cluster name
`freeipa_admin_user` | admin | FreeIPA admin user
`freeipa_admin_pass` | changeme | FreeIPA admin password. Password must be at least 8 characters long.
`freeipa_dm_pass` | `autogenerated` | FreeIPA directory manager password.
`freeipa_userid_start` | 2000 | UID range start used for user
`freeipa_userid_max` | 65535 | UID range end used for user
`freeipa_ansible_groups` | [] | List of ansible group to be create as group in FreeIPA. */!\ All servers declared in ansible group replaced servers declared in FreeIPA group. Servers in FreeIPA groups are replaced, not merged nor added /!\*

*Note* : In case of failed during cluster formation, it can be necessary to clear installation and restart. The following command must be execute on all FreeIPA server and will erase all FreeIPA :
```
/usr/sbin/ipa-client-install --uninstall
yum remove ipa-* sssd-ipa*
rm -rf /var/lib/ipa*
```

Dependencies
------------

basic-firewalld

Example Playbook
----------------

Simple example for FreeIPA standalone server :

```yaml
---
- hosts: freeipa-server
  vars:
    freeipa_domain: labs.lan
    freeipa_admin_pass: changeme
  roles:
    - freeipa-server
```

Example for FreeIPA cluster servers :

```yaml
---
- hosts: freeipa-server
  vars:
    freeipa_domain: labs.lan
    freeipa_admin_pass: changeme
    freeipa_hosts: "{{ groups['freeipa-server'] }}"
  roles:
    - freeipa-server
```


License
-------

BSD

Author Information
------------------
 * Sebastien GIRAUD <sebastien.giraud@smile.ci>