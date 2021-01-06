CONFD
=========

Role to install and configure confd. 

Requirements
------------

None.

Role Variables
--------------


Default variables are defined in defaults/ and vars/ directory.

Variable | Default value | Description
-------- | ------------- | -----------
 `confd_version`  | 0.16.0 | Confd version to install
 `confd_src_url`  | `https://github.com/kelseyhightower/confd/releases/download/v{{ confd_version }}/confd-{{ confd_version }}-linux-amd64` | URL used to download confd binary file
 `confd_src_checksum`  | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` | SHA256 checksum of download binary file
 `confd_backend`  | etcdv3 | Conf backend to used
 `confd_etcd_nodes`  | ['http://127.0.0.1:2379'] | Conf backend hosts list

Dependencies
------------

None.

Example Playbook
----------------

Simple playbook example :

```yaml
    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }
```

License
-------

BSD

Author Information
------------------

Sebastien GIRAUD : sebastien.giraud@smile.ci
