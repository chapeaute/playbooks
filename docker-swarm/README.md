Docker Swarm
=========

This role Deploy and initialize a Docker Swarm cluster.

Requirements
------------

None.

Role Variables
--------------

| Variable | Default value | MySQL variable |
| ---------|---------------|-------------- |
| `docker_node_manager` | *mandatory* | Ansible inventory group name of node used as docker swarm manager node |
| `docker_node_worker` | *mandatory* | Ansible inventory group name of node used as docker swarm worker node |
| `docker_cluster_bind_interface` | eth0 | Interface used for docker swarm cluster communication |
| `docker_metric_bind_interface` | docker0 | Interface used to activate metrics for node exporter |
| `docker_compose_version` | 1.21.2 | Docker compose version to used |
| `docker_compose_download_url` |  | Docker compose download URL |
| `docker_bashcompletion_download_url` |  | Docker compose Bash Completion download URL |

Dependencies
------------

Depend on docker role.

Example Playbook
----------------

Simple example to deploy and initialize a docker swarm cluster :

```yaml
---
- hosts: docker-node
  vars:
    docker_node_manager: "{{ groups['node-manager'] }}"
    docker_node_worker: "{{ groups['node-worker'] }}"
  roles:
    - role: docker-swarm

