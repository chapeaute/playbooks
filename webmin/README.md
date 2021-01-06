Webmin
=======

This role install webmin

Requirements
------------

* **None**

Role Variables
--------------

| Variable                | Default value | Description |
| ----------------------  | ------------- | ----------- |

------------

* **None**

Example Playbook
----------------

Sample playbook

```yml
- hosts: all
  roles:
      - webmin
```

Testing
--------

Install molecule and docker

```bash
sudo pip2 install molecule docker
```

For docker just follow the official doc
https://docs.docker.com/engine/installation/#supported-platforms

Launch the test with this command.

```bash
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
