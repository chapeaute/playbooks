Foreman
=========

Ansible Role to install and configure Foreman

Requirements
------------

* postgresql

Role Variables
-----------

Available variables are listed below, along with default values (see `defaults/main.yml`):

| Variable                | Default value | Description |
|----------|---------|--------------------|
| foreman_version  |  "2.2" | Foreman version to install |
| foreman_admin_username  |  admin | Foreman admin user
| foreman_admin_password  |  changeme | Foreman admin password
| foreman_db_host  |  "{{ ansible_fqdn }}" | Postgresql Host
| foreman_db_database  |  foreman  |
| foreman_db_username  |  foreman  |
| foreman_db_password  |   "{{ lookup('password', | 'credential/{{ inventory_hostname }} | -foreman_db_password chars=ascii_letters,digits') }}"
| foreman_enable_puppet  |  False | Enable/Disable puppet
| foreman_enable_puppetdb  |  False | Enable/Disable puppet db
| foreman_puppet_version  |  6 | Puppet version to isntall
| foreman_plugins  |  [] | Foreman plugins to install
| foreman_proxy_plugins  |  []  | Foreman proxy plugins to install
| foreman_compute  |  [] | Foreman compute plugins to install

Dependencies
-----

* basic-firewalld
* postgresql-provider

Example Playbook
-----

Install With Puppet

```yml
    - name: Install Puppet Master
      hosts: servers
      vars_files:
        - vars/main.yml
      roles:
        - role:  postgresql
          postgresql_version: 13
        - role:  foreman
```

Install With Ansible

```yml

    - name: Install Ansible plugin
      hosts: servers
      roles:
        - role:  postgresql
        - role:  foreman
          foreman_version: 1.19
          foreman_plugins:
            - ansible
            - remote-execution
          foreman_proxy_plugins:
            - ansible
            - remote-execution-ssh
```


When the install is successful, foreman can be accessed using https://foreman_fqdn with default credentials below

   User: admin
   Password: changeme

License
-----

MIT / BSD

References
------------

Documentation is avaiable from Foreman Website [https://www.theforeman.org/]

Author Information
----------------

* Jean-Vincent KASSI <jekas@smile.ci>
