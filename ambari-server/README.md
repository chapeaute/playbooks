Ambari Server
=========

This role installs an Ambari Server.

Requirements
------------

No requirements

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| ambari_version | 2.7.3.0 | Version of ambari
| ambari_root_dir | /var/lib | Install dir of ambari and hadoop services
| ambari_cluster_name | ambari | Name of the ambari cluster |
| ambari_hdp_version | 3.1 | HDP Version to install, https://supportmatrix.hortonworks.com/ |
| ambari_masters |  ["{{ inventory_hostname }}"]
| ambari_slaves  | "{{ ambari_masters }}"
| ambari_db_type | mysql | Type of database to use
| ambari_db_host | "{{ inventory_hostname }}" | Ip of database server or load balencer
| ambari_db_remote_host | "{{ ambari_db_host }}" | IP of database servers

Dependencies
------------

* **ambari-agent**
* **mariadb-server**

Examples Playbook
----------------

Simple example :

```yaml
---
- hosts: ambari-workers
  roles:
    - role: ambari-agent
      ambari-maser: ambari-master

- hosts: ambari-master
  roles:
    - role: ambari-server
      ambari_cluster_name: moncluster
      ambari_slaves: "{{ groups['ambari-workers'] }}"
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
molecule test
```

Docs on testing:
https://molecule.readthedocs.io

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>
