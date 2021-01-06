GitLab Runner
=========

Install, configure GitLab runner and register it to a GitLab server.

Requirements
------------

A GitLab server already must be installed before deploying this role. You must get server token in GitLab server web interface.
In RHEL 7, repository **rhel-7-server-extras-rpms** must be enabled if docker executor is used.

Role Variables
--------------

Variable | Default value | MySQL variable
---------|---------------|--------------
`gitlab_runner_executor` | docker | Runner executor to be used
`gitlab_runner_concurrent` | 3 | Limits how many jobs globally can be run concurrently
`gitlab_runner_check_interval` | 0 | Defines in seconds how often to check GitLab for a new builds
`gitlab_runner_docker_image` | ['ansible/centos7-ansible'] | Docker images list to be pull after installing docker
`gitlab_server_host` | {{ ansible_fqdn }} | GitLab server hostname or ip
`gitlab_server_url` | http://{{ gitlab_server_host }} | GitLab server url
`gitlab_server_token` |  | Token gathering from GitLab web interface in **Admin** > **Runners** section configuration. If not specified token is retrieved automatically from GitLab server database
`gitlab_user_deploy` |  | User name to create on server for auto deploy

Variable | Default value | Description
-------- | ------------- | -----------
`use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role.


Dependencies
------------

Use ansible _docker_ role if **gitlab_runner_executor** is define to value **docker**.

Example Playbook
----------------

Example to deploy a GitLab runner with Docker executor and register it to a GitLab server :

```yaml
---
- hosts: all
  roles:
    - role: gitlab-runner
      gitlab_runner_executor: docker
      gitlab_server_host: git.abj.smile.lan
      gitlab_server_token: 'Kk10wi9WnZHwLpdxAhFc'
      gitlab_runner_docker_image:
        - "ansible/centos7-ansible"
        - "docker.io/maven"
```

Example to deploy a Gitlab runner with docker and environment variables

```yaml
---
- hosts: all
  vars:
    gitlab_server_host: git.abj.smile.lan
    docker_http_proxy: "http://user:password@10.1.2.7:31280"
    docker_https_proxy: "http://user:password@10.1.2.7:3128"
    docker_no_proxy: "{{ gitlab_server_host }}"
    proxy_env:
      http_proxy: "{{ docker_http_proxy }}"
      https_proxy: "{{ docker_https_proxy }}"
      no_proxy: "{{ docker_no_proxy }}"
    gitlab_runner_env_vars: "{{ proxy_env }}"
  environment: "{{ proxy_env }}"
  roles:
    - role: gitlab-runner
      gitlab_runner_executor: docker
      gitlab_server_token: 'Kk10wi9WnZHwLpdxAhFc'
      gitlab_runner_docker_image:
        - "ansible/centos7-ansible"
        - "docker.io/maven"
```
