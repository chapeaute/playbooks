# Ansible Role: Varnish

Installs the [Varnish HTTP Cache](https://varnish-cache.org/) on RedHat/CentOS or Debian/Ubuntu Linux.

## Requirements

None

Role Variables
--------------

## Global configuration

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role. |

## Defaults configuration

Variable | Default value |Description
---------|---------------|--------------
`varnish_package_name` | varnish | Default varnish package name |
`varnish_version` | 4.1 | Varnish version that should be installed. See the [Varnish Cache packagecloud.io repositories](https://packagecloud.io/varnishcache) for a listing of available versions. Some examples include: `5.1`, `5.0`, `4.1`, `4.0`, `3.0`, and `2.1`. |
`varnish_config_path` | /etc/varnish | The path in which Varnish configuration files will be stored.
`varnish_listen_port` | 80 | The port on which Varnish will listen
`varnish_default_backend_host`  | 127.0.0.1 | Default backend host
`varnish_default_backend_port` | 8080 | Default backend port
`varnish_limit_nofile` |  131072 | The `nofiles` PAM limit Varnish will attempt to set for open files. The normal default is ~1024 which is much too low for Varnish usage.
`varnish_secret` | 14bac2e6-1e34-4770-8078-974373b76c90 | The secret/key to be used for connecting to Varnish's admin backend (for purge requests, etc.).
`varnish_admin_listen_host` | 127.0.0.1 | The host through which Varnish will accept admin requests
`varnish_admin_listen_port` | 6082  | The host and port through which Varnish will accept admin requests
`varnish_storage_type` | malloc | How Varnish stores cache entries (this is passed in as the argument for `-s`). Read [Getting Started guide](http://book.varnish-software.com/4.0/chapters/Getting_Started.html) for more informations
`varnish_storage_size_prct` | 0.8 | Percentage of memory reserved for Varnish
`varnish_pidfile` |  /run/varnishd.pid | Varnish PID file path. Set to an empty string if you don't want to use a PID file.
`varnish_enabled_service` | ["varnish","varnishncsa"] | Services that will be started at boot and should be running after this role is complete. You might need to add additional services if required, e.g. `varnishncsa` and `varnishlog`. If set to an empty array, no services will be enabled at startup.

## Manage backends

You can manage multiple backends like with apache virtual hosts
Example:

```yml
    varnish_backends:
      apache:
        host: 10.0.2.2
        port: 80
      nodejs:
        host: 10.0.2.3
        port: 80

    varnish_vhosts:
      example.com:
        backend: apache
      nodejs.example.com:
        backend: nodejs
```

You can configure multiple backends (and direct traffic from multiple virtual hosts to different backends) using the `varnish_backends` and `varnish_vhosts` variables. If you only use one backend (defined via `varnish_default_backend_host` and `varnish_default_backend_port`), then you do not need to define these variables. Do not add a `www` to the `vhosts` keys; it is added automatically by the `backends.vcl.j2` VCL template.

You can edit the default.vcl safely. It will not be overwritten by ansible

## Dependencies

None.

## Example playbook

Simple playbook just install

```yml

- hosts: all
  role: varnish
```

Simple playbook with default backend

```yml
  roles:
    - role: apache
      apache2_disabled_default: []
      apache2_port: 8080
    - role: varnish
      varnish_default_backend_host: 127.0.0.1
      varnish_default_backend_port: 8080
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
