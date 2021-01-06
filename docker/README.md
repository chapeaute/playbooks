Docker
=========

Install Docker and pull images

Requirements
------------

In RHEL 7, repository **rhel-7-server-extras-rpms** must be enabled if docker executor is used.

Role Variables
--------------

Variable | Default value | MySQL variable
---------|---------------|--------------
`docker_data_dir` | /var/lib/docker | docker data directory
`docker_images` | [] | docker image to pull after installing docker
`docker_storage_driver` | overlay2 | Storage driver to used by docker
`docker_metric_bind_interface` | | Docker interface to exposed metrics

Variables settings to configure proxy for internet access (used to pull docker images) :

Variable | Default value | MySQL variable
---------|---------------|--------------
`docker_http_proxy` | | Proxy to used for http
`docker_https_proxy` | | Proxy to used for https
`docker_no_proxy` | | Host to access directly without using proxy
`docker_log_driver` |  | Driver log to be used: *json-file* or *journald*
`docker_log_opts` | {"max-size": "256m","max-file": "4"} | Driver log options. Default value are for "json-file" log driver.
`docker_log_json_maxsize` | 256m | Maximum file size of json-driver file
`docker_log_json_maxfile` | 4 | Log file retention
`docker_log_journald_persit` | false | Enable journald persitent log after reboot



Variable | Default value | Description
-------- | ------------- | -----------
`use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role.

Dependencies
------------

None.

Example Playbook
----------------

Simple example to deploy docker and pull somes basic images :

```yaml
---
- hosts: all
  roles:
    - role: docker
      docker_images:
        - "ansible/centos7-ansible"
        - "docker.io/maven"
```
