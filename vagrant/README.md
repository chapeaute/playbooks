Vagrant
=========

Install Vagrant

Requirements
------------

None.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `vagrant_version` | 1.9.1  | Vagrant version to install  |
| `vagrant_home` | /var/lib/vagrant | Vagrant home directory |
| `vagrant_deploy_template` | false | Deploy vagrant template project directory projet |
| `vagrant_box_image` | SMILE_CI/centos7 | Default vagrant box image to use when creating VM |
| `vagrant_plugins` | ['vagrant-libvirt', 'vagrant-triggers'] | Vagrant plugin list to install |
| `vagrant_group_owner` | root | Group owner of ansible role, playbook and template project |

Variable to manage DNS entries when creating/deleting VM (use bind dynamic dns update fonctionality) :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `vagrant_libvirt_dft_pool` | default | Default pool where virtual VM disk should be created |
| `vagrant_libvirt_dft_net` | virbr0 | Default bridge network to connect VM |


Variable to manage Ansible :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `vagrant_ansible_deploy` | True | Deploy ansible |
| `vagrant_ansible_deploy_role` | True | Deploy role from Smile repository |

Variable to manage DNS entries when creating/deleting VM (use bind dynamic dns update fonctionality) :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `vagrant_manage_dns` | false | Enable Dynamic DNS update |
| `vagrant_dns_domain` | smile.labs | DNS domain name to assign to VM and used to provisonning DNS zone |
| `vagrant_dns_server` | 127.0.0.1 | DNS server to update |
| `vagrant_dns_ddnskey` | /etc/named/Knsupdate.key | DDNS key used to connect to DNS server with nsupdate |


Dependencies
------------

None.

Example Playbook
----------------

Simple example :

```yaml
---
- hosts: all
  roles:
    - role: vagrant
```


Complexe example :

```yaml
---
- hosts: all
  roles:
    - role: vagrant
      vagrant_deploy_template: true
      vagrant_plugins:
        - vagrant-libvirt
        - vagrant-triggers
```


Full playbook example to deploy vagrant using bind and libvirt :

```yaml
---
- hosts: all
  roles:
    - role: libvirt-kvm
    - role: bind
      bind_ddns_enable: true
      bind_ddns_key_name: dev.smile.lan
      bind_zone_conf_manage: true
      bind_zone:
        dev.smile.lan:
          subnet: 172.17.0.0
          servers: ['172.17.0.1']
    - role: vagrant
      vagrant_home: /var/lib/vagrant
      vagrant_group_owner: exploit
      vagrant_deploy_template: true
      vagrant_manage_dns: true
      vagrant_dns_domain: dev.smile.lan
      vagrant_plugins:
        - vagrant-libvirt
        - vagrant-triggers
```

Usage
-----

**Step 1** : Create new project in **{{ vagrant_home }}/project** by cloning **template** directory with name **clientname-projectname**. Example:

```
root# cp -a /var/lib/vagrant/project/template /var/lib/vagrant/project/ocit-magistere
root# cd /var/lib/vagrant/project/ocit-magistere
```


**Step 2** : Edit **servers.json** with VM project configuration


**Step 3** : Start environnement by executing command :

```
root# vagrant up
```
