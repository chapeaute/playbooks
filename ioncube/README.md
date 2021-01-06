ioncube
=========

Install IONCUBE

Role Variables
--------------

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `ioncube_default_loader`| `7.2` | Default ioncube loader. According your php version you have to define ioncube loader  |
| `ioncube_default_extension_dir`| '/usr/lib64/php/modules/' | PHP default extension dir for x86_64 |

Dependencies
------------

* php

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
    - hosts: ioncube
      vars:
        ioncube_loader: "7.2"
      roles:
        - role: ioncube
          ioncube_default_loader: "{{ ioncube_loader }}"
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

* Franck Aboa<franck.aboa@smile.ci>
