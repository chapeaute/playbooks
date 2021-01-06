Scala
=========

Install Scala

Requirements
------------

None.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `scala_version` | 2.12.5 | scala version to install |


Dependencies
------------

None.

Example Playbook
----------------

Scala :

```yaml
- hosts: all
  roles:
    - role: scala
```
