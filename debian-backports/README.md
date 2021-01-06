Debian/Ubuntu Backports
--------------------------

Adds backports repository for Debian and Ubuntu.

Dependencies
------------

None

Variables
---------

- `backports_uri`: URI of the backports repository; change this if you want to use a particular mirror.
    + Debian: `http://ftp.debian.org/debian`
    + Ubuntu: `http://archive.ubuntu.com/ubuntu`
- `backports_components`: Release and components for sources.list
    + Debian: `{{backports_distribution}}-backports backports main contrib non-free`
    + Ubuntu: `{{backports_distribution}}-backports main restricted universe multiverse`

Example
---------

```yml

- hosts: all
  roles:
    - role: debian-backports

```

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>