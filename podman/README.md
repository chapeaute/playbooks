podman
=========

Install podman

Requirements
------------

* **None**

Role Variables
--------------

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `podman_data_dir` | /var/lib/containers/storage | podman containers storage directory
| `podman_images` | [] | podman image to pull after installing podman

Dependencies
------------

* **None**

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
- hosts: all
  roles:
    - role: podman
```

Testing
--------

Launch the test

```bash
pip install molecule molecule[docker]
molecule test
```

[Docs on testing](https://molecule.readthedocs.io)

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
