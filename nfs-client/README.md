NFS Client
=========

This role install a nfs client and mount remote nfs server directory

Requirements
------------

No requirements

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `nfs_selinux_httpd_enable` | `true` | Enable SELinux boolean to allowed httpd daemon to use NFS |
| `nfs_mounts` | [] | Array of nfs mount |
| `nfs_mounts.server` |  | ip address of remote nfs server |
| `nfs_mounts.mounted` | `true`  | Status of mount point |
| `nfs_mounts.localdir` |  | local mount point |
| `nfs_mounts.remotedir` |  | remote nfs directory |

Dependencies
------------

No dependencies

Examples Playbook
----------------

```YAML
---
- hosts: servers
  roles:
    - role: nfs-client
      nfs_mounts:
        - server: 127.0.0.1
          localdir: /srv/backups
          remotedir: /export/ftpbackup
```
