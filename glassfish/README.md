Glassfish
=========

This role install and configure glassfish server. This role can also managed Glassfish domain.

Requirements
------------

**None**

Role Variables
--------------

Variable | Default value | MySQL variable
---------|---------------|----------------
`glf_version` | 5.0 | glassfish version to install
`glf_java_impl` | oraclejdk | Implementation of java to use oraclejdk or openjdk
`glf_java_version` | 8 | Java version to use
`glf_root_dir` | /var/lib | Installation dir of glf
`glf_service_name` | glassfish | Name of service used to manage glassfish
`glf_user` | glassfish | The name of the user created to run the service
`glf_group` | glassfish | The name of the group created to run the service
`glf_use_rsyslog` | false | Configure glassfish to use local rsyslog server
`glf_memory_size_prct` | 0.8 | Percentage of total memory allocated
`glf_memory_size` | 80% of RAM | Percentage of total memory allocated


Monitoring parameters :

Variable | Default value | MySQL variable
---------|---------------|----------------
`glf_monitoring_user` | glassfish | Glassfish monitoring user
`glf_monitoring_password` | **generated** | Glassfish monitoring password
`glf_jmx_server_port` | 8686 | Configure jmx server port


Domain management :

Variable | Default value | MySQL variable
---------|---------------|----------------
`glf_default_domain` | domain1 | Default domain create by glassfish
`glf_default_admin_passwd` | changeme | Default domains administrative password
`gfl_default_port` | [ '8080', '4848', '8181' ] | Default port used by domains
`glf_domains` | `undef` | If defined create domain from array
`glf_domains.name` | **mandatory** | Name of domain to create
`glf_domains.state` | `present` | State of domain. If state is `present` or not defined, a new domain will me created if not already exist. If state is `absent`, domain will be removed if exist.
`glf_domains.admin_port` | **mandatory** | Glassfish administrative port of domain
`glf_domains.app_port` | **mandatory** | Glassfish port used by users to access application
`glf_domains.admin_passwd` | `glf_default_admin_passwd` | Password used to access domain administrative interface

**Note:** Login to access administrative domain interface is **admin**.
**Note:** A systemd glassfish service is created for each domain : glassfish@`glf_domains.name`

Domain can be managed by systemctl command:

```bash
# systemctl status glassfish@domain_name
# systemctl start glassfish@domain_name
# systemctl restart glassfish@domain_name
# systemctl stop glassfish@domain_name
```

Example of domain to create :

```yml
glf_default_domain: domain1
glf_default_admin_passwd: changeme
glf_domains:
  - name: "{{ glf_default_domain }}"
    state: absent
  - name: sva
    admin_port: 4949
    app_port: 8081
  - name: omoney
    admin_port: 5050
    app_port: 8082
    admin_passwd: sigipsr
```

Dependencies
------------

* **openjdk** or **oraclejdk**

Example Playbook
----------------

Simple playbook

```yml
- hosts: all
  roles:
    - role: glassfish
```

Playbook with custom domain management :

```yml
- hosts: all
  vars:
    glf_root_dir: /srv
  roles:
    - role: glassfish
      glf_domains:
        - name: "{{ glf_default_domain }}"
          state: absent
        - name: sva
          admin_port: 4949
          app_port: 8081
        - name: omoney
          admin_port: 5050
          app_port: 8082
          admin_passwd: sigipsr
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
