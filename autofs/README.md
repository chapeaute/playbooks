AutoFS
=========

This role installa and configure

Requirements
------------

None

Role Variables
--------------

Autofs map variables

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `autofs_masters_dir` | /etc/auto.master.d | Directory with all master files
| `autofs_maps_dir`  | /etc/auto.map.d | Directory with all maps dir
| `autofs_default_master_options` | '--ghost' | Default master option
| `autofs_default_mount_options` | -fstype=nfs,rw,soft,noatime | Default mount options
| `autofs_mounts` |  | Dictionary with autofs map |
| `autofs_mounts.mount_point` |   | Define autofs mount point |
| `autofs_mounts.url` |   | Set remote nfs connection |
| `autofs_mounts.state` | present  | Set to `absent` if zone must be removed |

Dependencies
------------

* nfs-client

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - role: autofs
      autofs_mounts:
        mapname:
          map: napname # optional key value
          mount_point: /home/test
          url: 127.0.0.1:/var/www
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
