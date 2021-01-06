Kubernetes
=========

This role configure and deploy a kubernetes cluster

Requirements
------------

* 2 GB ram
* 2 CPU

Role Variables
--------------

Variable | Default value | MySQL variable
---------|---------------|--------------
`k8s_version` | 18.06 | k8s version
`k8s_master_node` | "{{ ansible_fqdn }} | k8s master node hostname or ip address
`k8s_slave_nodes` | [] | k8s slave nodes
`k8s_docker_version` | 18.06 | Docker version to use


Dependencies
------------

* docker

Example Playbook
----------------

Sample playbook file

```yml
  - hosts: kubernetes
    roles:
      - role: kubernetes
        k8s_master_node: master_node
        k8s_slave_nodes: "{{ groups['k8s_slaves'] }}"
```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
