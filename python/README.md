Python
=========

This role deploy python package.

Requirements
------------

None.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

Variable | Default value |Description
---------|---------------|--------------
`python_version` | 3.4 | Python version to installed (available version: **3.4**, **3.5** or **3.6**)
`python_packages` | python34 | Default python packages to installed
`python_extra_packages` | [] | Add extra python packages install from SCL repository (recommanded way, but must be available in SCL repository)
`python_pip_modules` | [] | Python module list to install via pip
`python_install_devtools` | False | Install **gcc** sometimes needed to compile Python module when install with **pip**.


Dependencies
------------

None.


Example Playbook
----------------

Simple playbook to deploy Cassandra server :

```yaml
- hosts: python
  vars:
    python_version: 3.4
  roles:
    - role: python

