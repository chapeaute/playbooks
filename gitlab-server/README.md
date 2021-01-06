GitLab Server
=========

Install, configure a GitLab server.

Requirements
------------

None.

Role Variables
--------------

| Variable | Default value | Description |
| ---------|---------------|-------------- |
| `gitlab_unicorn_worker` | 3 | Unicorn worker parameter |
| `gitlab_unicorn_listen` | 0.0.0.0 | Unicorn listen interface |
| `gitlab_user_deploy` |  | User name to create on server for auto deploy |
| `gitlab_backup_dir` | /var/backup/gitlab | Gitlab backup dir
| `gitlab_external_url` | ansible_fqdn | Gitlab external url


Dependencies
------------

None.

Example Playbook
----------------

Simple example to deploy a GitLab server :

```yaml
---
- hosts: all
  roles:
    - role: gitlab-server
```

Complete example to deploy GitLab server with a runner using Docker executor :

```yaml
- hosts: all
  roles:
    - role: gitlab-server
    - role: gitlab-runner
      gitlab_runner_executor: docker
      gitlab_runner_docker_image:
        - "ansible/centos7-ansible"
```
