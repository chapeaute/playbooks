Ruby
----

Installs Ruby and bundler gem on Linux.

Requirements
-------------

None.

Role Variables
-------------


Variable | Default value |Description
---------|---------------|--------------
ruby_install_from_source | false  | Compile a specfic version of ruby from source instead of package by default
ruby_version | 2.2.1  | Version to compile if `ruby_install_from_source` is true
ruby_install_gems | []  | A list of Ruby gems to install (just the name of the gem to be installed). This is meant as a simple convenience, and will only install the latest version of the gem. If you need to install gems with more options or specificity, you can do so elsewhere in your playbook.

Dependencies
---------------

None.

Example Playbook
-----------------

```yaml
- hosts: all
    roles:
    - role: ruby
```

Testing
--------

Install molecule and docker

```bash
sudo pip2 install molecule docker
For docker just follow the official doc
https://docs.docker.com/engine/installation/#supported-platforms
```

Launch the test with this command.

```
molecule verify # lint role
molecule check # dry run
molecule test # launch test from scracth
# You can relaunch test after with existing instances
ansible-playbook playbook
```

Docs on testing:
https://molecule.readthedocs.io

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>