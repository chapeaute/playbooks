Mule ESB
=========

This module download and configure service for mule esb standalone

Requirements
------------

This role requires Ansible 1.4 or higher, and platform requirements are listed in the metadata file.
You need also to have a jdk environment

Role Variables
--------------

The variables that can be passed to this role and a brief description about them are as follows:

Variable | Default value | MySQL variable
---------|---------------|----------------
`mule_esb_version` | 3.8.0 | Mule ESB version
`mule_esb_service_name` | mule-esb | Mule ESB service name  used in systemd
`mule_esb_user` | `mule_esb_service_name` | Mule ESB user name
`mule_esb_group` | `mule_esb_service_name` | Mule ESB group name 
`mule_esb_root_dir` | /var/lib | Mule ESB root path
`mule_esb_logs_dir` | /var/log/mule-esb | Mule ESB log directory
`mule_esb_memory_size_prct` | 0.75 | Percentage of ram used by mule-esb
`mule_esb_env` | | Define environnement variables project to load. Usefull in multi-environement (development, staging, production)
`mule_esb_limit_openfiles` | 8192 | Max openfiles allow to open for mule-esb daemon
`mule_esb_wrapper_opts` | [] | Defined additionnal key=value in wrapper.conf


Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

* **openjdk**
* **generic-service**

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```
- hosts: all
  environment:  # You can define proxies
    http_proxy: http://proxy:3128 # http proxy
    https_proxy: http://proxy:3128 # or https proxy
  roles:
    - role: mule-esb
      mule_esb_root_dir: /var/lib # Root dir
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
