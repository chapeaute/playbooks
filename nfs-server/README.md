NFS Server
=========

This role install a nfs server and configure directory to export

Requirements
------------

No requirements

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `nfs_data_dir` | `/var/lib/nfs_data` | Where nfs export data while be put. Also used by Bacula to backup data. |
| `nfs_exports` | [] | Array of NFS exports |
| `nfs_exports.directory` | **mandatory**  | Directory to export (create it, if not exists) |
| `nfs_exports.hosts` | ['*'] | Host client list declare according to NFS syntax https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/deployment_guide/s1-nfs-server-config-exports |
| `nfs_exports.options` | rw,sync,no_root_squash | Options to mount point |
| `manage_by_cluster` | False | Variable set to true if service state must be managed by a cluster solution (like PCS) |

Dependencies
------------

No dependencies

Examples Playbook
----------------

```YAML
---
- hosts: all
  roles:
    - role: nfs-server
      nfs_exports:
        - directory: "{{ nfs_data_dir }}/incidents_img"
          hosts: "{{ groups['all'] }}
```
