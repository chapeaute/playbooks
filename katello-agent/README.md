Role Name
=========

Install Katello Agent and register to Katello server to manage host repository and content.

Requirements
------------

None.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `katello_version` | 3.4 | Katello client version to install |
| `katello_server` | localhost | Katello server address used to register client |
| `katello_organization` | Smile | Organization in Katello where host must be register |
| `katello_activation_key` | SmileKey | Activation Key in Katello server used to autenticate Katello client |
| `katello_force_register` | false | Force registration to Katello server even if a registration already exists |
| `katello_repofile_delete` | [CentOS-*, epel*, katello-client.repo] | Repository list file in **/etc/yum.repos.d/** directory managed by Katello that is not already necessary on client |


| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role. |

Dependencies
------------

None.

Example Playbook
----------------

Simple example :

```yaml
- hosts: katello-agent
  roles:
  - role: katello-agent
    katello_server: katello.ovh.smile.lan
    katello_organization: Smile
    katello_activation_key: Smile
    katello_repofile_delete:
      - CentOS-*.repo
      - epel*.repo
      - katello-client.repo
```
