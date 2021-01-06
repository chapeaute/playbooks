Basic disk
=========

This role create,format,mount volume groups and lvm partitions

Requirements
------------

* **None**

Role Variables
--------------

| Variable | Default value | Description  |
| ---------|---------------|-------------- |
| `vg_lists`      | []            | Array of volume group to create |
| `vg_lists.name` |          | Name of the volume group to create
| `vg_lists.pvs`  |          | List of physical volume to use to create volume group
| `vg_lists.state`  | present    | State of the volume group
| `lvs_lists`     | []            | Array of logical volumes to create |
| `lvs_lists.name` |          | Name of the logical volume to create
| `lvs_lists.vg`  |          | Name of the volume group to use
| `lvs_lists.size`  |          | Size of the logical volume to create
| `lvs_lists.state`  |  present       | State of the logical volume
| `lvs_lists.active`  |  yes         | Set if logical volume is active or not
| `lvs_lists.mount_point`  |          | Mount point of the logical volume
| `lvs_lists.fstype`  |  ext4         | FS type of the logical volume

Dependencies
------------

* **None**

Example Playbook
----------------

Sample playbook

```yml
- hosts: all
  roles:
    - role: basic-disk
      vgs_lists:
        - name: data
          pvs: /dev/sdb
      lvs_lists:
        - name: srv
          vg: data
          size: 100%FREE
          mount_point: /srv
          fstype: ext4 # default
```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
