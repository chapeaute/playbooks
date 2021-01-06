Role Name
=========

This role install and register FreeIPA client to IPA server.

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
`freeipa_admin_user` | admin | FreeIPA admin user
`freeipa_admin_pass` | changeme | FreeIPA admin password. Password must be at least 8 characters long
`freeipa_force_register` | false | Force FreeIPA register by removing and reinstalling FreeIPA client

*Note* : In case of failed during cluster formation, it can be necessary to clear installation and restart. The following command must be execute on all FreeIPA server and will erase all FreeIPA :
```
/usr/sbin/ipa-client-install --uninstall -U
yum remove -y ipa-* sssd-ipa* certmonger
rm -rf /var/lib/ipa* /etc/ipa /var/lib/certmonger /etc/certmonger /var/lib/sss
```


Dependencies
------------

basic-firewalld

Example Playbook
----------------

Simple example :

```yaml
---
- hosts: freeipa-client
  vars:
    main_interface: eth1
    freeipa_domain: labs.lan
    freeipa_admin_pass: changeme
    freeipa_hosts: "{{ groups['freeipa-server'] }}"
  roles:
    - freeipa-client
```


License
-------

BSD

Author Information
------------------
 * Sebastien GIRAUD <sebastien.giraud@smile.ci>
