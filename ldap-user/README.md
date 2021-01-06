LDAP User
=========

This role fetch user informations in a ldap server.
This is a meta role for the basic-user role.

Requirements
------------

* Install python-ldap: pip install python-ldap

Role Variables
--------------

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `ldap_users` | [] | List of users to create|
| `ldap_users_groups` | [] | List of the default groups for the users |

Dependencies
------------

* None

Example Playbook
----------------

```yml

- hosts: all
  vars:
    # Default context
    #lookup_ldapkey_url: "ldap://ldap.ovh.smile.lan/dc=groupe,dc=lan?sshPublicKey?sub?(uid=%s)"
    lookup_ldapkey_url: "ldap://ldap.ovh.smile.lan/dc=groupe,dc=lan?sshPublicKey?sub?(uid=%s)"
    lookup_ldapkey_binddn: # Bind DN
    lookup_ldapkey_bindpw: # Bind Password
  roles:
    - role: basic-user
      ldap_users:
        - jekas
        - jekof
      ldap_users_groups: ['exploit']
```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
