asterisk
=========

Install and configure asterisk

Requirements
------------

None

Role Variables
--------------

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `asterisk_version` | 16 | Asterisk version to install
| `asterisk_sounds` | ['fr','en'] | Asterisk sounds file to install, by default we install french and english
| `asterisk_modules` | ['pjsip','sip'] | Asterisk modules to instal
| `asterisk_codes` | ['g722','alaw','ulaw','g729'] | Asterisk modules to instal

Dependencies
------------

None

Example Playbook
----------------

Simple playbook

```yml
- hosts: all
  roles:
    - role: asterisk
      asterisk_version: 16
```

This role can also config aor with the pjsip module

```yml
- hosts: all
  roles:
    - role: asterisk
      asterisk_version: 16
    - id: 101
      type: aor
      configs:
        - max_contacts=1
    - id: auth101
      type: auth
      configs:
        - auth_type=userpass
        - username=101
        - password=101
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

* Jean-Vincent KASSI<jean.kassi@smile.ci>
