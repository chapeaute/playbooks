wekan
=========

This role install wekan 

Requirements
------------

None

Role Variables
--------------


| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| wekan_root_dir | /var/lib  | Root folder wekan
| wekan_version | 4.22 | wekan version
| wekan_site_url | "http://{{ ansible_fqdn }}" | Wekan site url
| wekan_mongo_host | localhost | Ip of mongo database 
| wekan_smtp_host | localhost | Ip of smtp server
| wekan_smtp_port | 25 | Port of smtp server
| wekan_smtp_from | "no-reply@{{ ansible_domain }}" | Head from of mails

Dependencies
------------

* nodejs
* generic-service
* apache-proxy

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml

- hosts: wekan
  roles:
    - role: mongodb
    - role: wekan
      wekan_root_dir: /var/lib
      wekan_site_url: http://wekan.domain.org

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

* Narcisse Konan<nakon@smile.ci>
