Basic Firewalld
=========

Configuration firewalld rules and interfaces.

Requirements
------------

Firewalld must be available in Linux distribution.

Role Variables
--------------

Variable | Default value | Description
-------- | ------------- | -----------
`firewalld_enable` | true  | Install, enable and start firewalld service
`firewalld_rules_add` | {}  | List rules to be added on a specific zone
`firewalld_rules_add.zone` | `mandatory` | Zone where rule will be added
`firewalld_rules_add.ports` | [] | List of port/protocol to open on firewall (i.e 9200/tcp)
`firewalld_rules_add.services` | [] | List of services to enable on firewall (services list available in `/usr/lib/firewalld/services/`)
`firewalld_rules_remove` | {}  | List rules to be removed on a specific zone
`firewalld_rules_remove.zone` | `mandatory` | Zone where rule will be removed
`firewalld_rules_remove.ports` | [] | List of port/protocol to close on firewall (i.e 9200/tcp)
`firewalld_rules_remove.services` | [] | List of services to disable on firewall (services list available in `/usr/lib/firewalld/services/`)
`firewalld_interfaces` | []  | Assign network interfaces to specific zone
`firewalld_interfaces.zone` | `mandatory`  | Assign network interfaces to specific zone
`firewalld_interfaces.intefaces` | []  | List of network interfaces to assign on zone
`firewalld_interfaces.state` | present  | use `present` to move interfaces in zone, use `absent` to remove interface from zone.

Dependencies
------------

None.

Example Playbook
----------------

Example to add rules on zone :

```yaml
- hosts: all
  roles:
  - role: basic-firewalld
    firewalld_rules_add:
    - zone: public
      services:
        - http
        - https
    - zone: external
      ports:
        - 9200/tcp
      services:
        - http
        - https
```

Example to remove rules from zone :

```yaml
- hosts: all
  roles:
  - role: basic-firewalld
    firewalld_rules_remove:
    - zone: public
      services:
        - http
        - https
    - zone: external
      ports:
        - 9200/tcp
      services:
        - http
        - https
```

Assign `eth1` network interface to `external` zone. If `eth1` is already assign to another zone it will be automatically move to `external` zone (interface can be only assign to one zone at a time) :

```yaml
- hosts: all
  roles:
  - role: basic-firewalld
    firewalld_interfaces:
    - zone: external
      interfaces:
        - eth1
```

License
-------

BSD

Author Information
------------------

* Sébastien GIRAUD (segir@smile.ci)
