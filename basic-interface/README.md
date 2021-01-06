basic-interface
=========

This role permit to manage server network interfaces

Requirements
------------

None

Role Variables
--------------

Variable | Default value |Description
---------|---------------|--------------
`rename_interfaces` | {} | List of interfaces to rename
`interfaces` | {} | List of the intefaces to assign

Dependencies
------------

None

Example Playbook
----------------

Rename inerface

```yml
- hosts: all
  roles:
    - role: basic-interface
      rename_interfaces:
        eth0: adm
        eth1: data

```

Assign inerface

```yml
- hosts: all
  roles:
    - role: basic-interface
      interfaces:
        data:
          address: 192.168.1.0
          netmask: 255.2555.255.0

```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
