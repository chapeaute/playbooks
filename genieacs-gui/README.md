Genieacs GUI
=========

This role install genieacs gui web interface

Requirements
------------

* **None**

Role Variables
--------------


Variable | Default value |Description
---------|---------------|--------------
`genieacs_gui_api_host` | localhost | Genieacs ACS CWMP Api Host (see role: genieacs)
`genieacs_gui_api_port` |  7557 | Genie ACS CWMP Api port (see role: genieacs)
`genieacs_gui_port` |  8080 | Genieacs ACS GUI Web port
`genieacs_gui_data_dir` | /var/lib/genieacs-gui | Genie acs installation directory
`genieacs_gui_adapter` | sqlite | Database adapater
`genieacs_gui_mongodb_host` | 127.0.0.1 | Mongodb host if adapater is mongodb

Dependencies
------------

* ruby
* generic-service


Example Playbook
----------------

```yml
    - hosts: servers
      roles:
         - role: genieacs-gui
```

Testing
--------

Install molecule and docker

```sh
sudo pip2 install molecule docker
#For docker just follow the official doc
#https://docs.docker.com/engine/installation/#supported-platforms
```

Launch the test with this command.

```sh
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