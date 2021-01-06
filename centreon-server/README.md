Centreon Server
=========

Install Centreon server version CES 3.4.

Requirements
------------

If database is not installed on the same server than centreon central, MariaDB must be install and configure on remote database before deploying centreon-server role.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_clapi_conf` | /etc/centreon/clapi.conf" | CLAPI configuration file |
| `centreon_admin_pass` | changeme | Password for user admin |
| `centreon_timezone`   | Africa/Abidjan | Centreon timezone |
| `centreon_conf_import` | true | Download centreon configuration from `centreon_conf_url`, put it in **/var/tmp/centreon-conf.txt** file and automatically import configuration. Otherwise, configuration can be import with **centreon-conf-import** script. |
| `centreon_conf_url` | http://archive.smile.ci/centreon/centreon-conf.txt | Centreon configuration file URL to download and import in centreon. |

Variables used for remote database (only necessary if database isn't on same server than centreon central) :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_db_host` | 127.0.0.1 | Database IP address or hostname |
| `centreon_db_inventory_host` | `centreon_db_host` | Use if database server address used by centreon server is different than host define in ansible inventory used to configure remote database server |
| `centreon_db_admin_user` | root | MariaDB admin user used to connect for configuring database |
| `centreon_db_admin_pass` | changme | MariaDB admin password used to connect for configuring database |


Dependencies
------------

This role depends on Apache and PHP.

Example Playbook
----------------

#### Example to deploy centreon central server with database on same server :

```yaml
---
- hosts: all
  vars:
    centreon_clapi_pass: S3cr3tCLAPIP@55w0rD
  roles:
    - role: mariadb-server
      mysql_config_bind_address: 127.0.0.1
      mysql_config_innodb_buffer_pool_size_prct: 0.4
    - role: centreon-server
```

#### Example to deploy centreon central and database on different server :

 * Playbook to deploy MariaDB on database server :

```yaml
---
- hosts: centreon-database
  roles:
    - role: mariadb-server
```

 * Playbook to deploy centreon central :

```yaml
---
- hosts: centreon-server
  vars:
    centreon_clapi_pass: S3cr3tCLAPIP@55w0rD
  roles:
    - role: centreon-server
      centreon_db_host: 192.168.122.123
```


Export configuration
------

Configuration can be export with **centreon-conf-export** scripts :

```
centreon-conf-export TPL-ONLY > /tmp/centreon-conf.txt
```


Import configuration
------

After wizard installation you can import configuration with following command if variable `centreon_conf_download` is set to `true` (Messages on output can be ignore.) :

```
centreon-conf-import /var/tmp/centreon-conf.txt
```

Tutorials
======

Step 1 : Declare common variables
------

The first step consist to declare globals variables defined in **group_vars/all** common to all installation :

```yaml
---
# Monitoring server variables
centreon_clapi_user: admin
centreon_clapi_pass: sigipsr

# Monitoring client variables
snmp_community: client-ro
monitoring_nagios_db_user: monitoring
monitoring_nagios_db_pass: YSk5vdzQN4NngCJt
monitoring_nagios_enable: true
monitoring_nagios_server_fqdn: 127.0.0.1 # Check by SSH in localhost
```

For next step, choose one of the following 3 installations (1 Central or 1 Central + 1 DB or 1 Central + 1 DB + N Pollers) :



Step 2 : Installation for 1 Central
------

This howto describe step by step guide to deploy Centreon server all in one server and to deploy agent :

 * Centreon playbook _centreon.yml_ :

```yaml
---
- hosts: centreon-central
  roles:
    - role: mariadb-server
      mysql_config_bind_address: 127.0.0.1
      mysql_config_innodb_buffer_pool_size_prct: 0.4
    - role: centreon-server
      centreon_db_admin_pass: "{{ mysql_root_password }}"
```


 * Deploy centreon server :

```
ansible-playbook centreon.yml
```





Step 2 : Installation for 1 Central + 1 Database
------

This howto describe step by step how to deploy Centreon web server and database on separate server, and how to deploy agent on both server to monitor them :


 * Database playbook _centreon-database.yml_ :

```yaml
---
- hosts: centreon-database
  roles:
    - role: mariadb-server
```

 * Centreon server playbook _centreon-server.yml_ :

```yaml
---
- hosts: centreon-central
  roles:
    - role: centreon-server
      centreon_db_host: centreon-database
```


 * Execute playbook _centreon-database.yml_ first, then _centreon-server.yml_ in same command line :

```
ansible-playbook centreon-database.yml centreon-server.yml
```





Step 2 : Installation for 1 Central + 1 Database + 1 Poller
------

This howto describe step by step how to deploy Centreon web server and database on separate server, and how to deploy agent on all server to monitor then :


 * Database playbook _centreon-database.yml_ :

```yaml
---
- hosts: centreon-database
  roles:
    - role: mariadb-server
```

 * Centreon server playbook _centreon-server.yml_ :

```yaml
---
- hosts: centreon-central
  roles:
    - role: centreon-server
      centreon_db_host: centreon-database
```


 * Centreon server playbook _centreon-poller.yml_ :

```yaml
---
- hosts: centreon-poller
  roles:
    - role: centreon-poller
      centreon_server: centreon-central
```


 * Execute playbook _centreon-database.yml_ first, then _centreon-server.yml_ in same command line :

```
ansible-playbook centreon-database.yml centreon-server.yml centreon-poller.yml
```


After centreon poller was deployed with playbook and registered to Centreon server, some configurations are needed in order to make it definitively usable.

 * Connect to Centreon web interface with admin account and in **Configuration** > **Pollers** > **Broker configuration** menu, click on **Add with wizard**

 * Select **Simple poller** and click **Next** button

 * Enter informations on following fields :

   * Configuration name : _**poller hostname**_
   * Requester : select _**poller hostname**_
   * Central address : _**centreon central server hostname**_


 * Click on **Finish** button to validate configuration and in **Broker configuration** menu, activate broker by clicking on **green check** icon

 * In **Engine configuration** menu, edit new poller engine configuration, and in **Data** tab, click on **+ Add a new entry** and enter following value

```
/usr/lib64/centreon-engine/externalcmd.so
```

 * Click on "Save button" to finish poller configuration





Step 3 : Deploy agent
------


 * Centreon agent playbook _centreon-agent.yml_ :

```yaml
---
- hosts: centreon-agent
  roles:
    - role: snmp
      snmp_allow_clients: [ 'centreon-poller' ]
    - role: centreon-agent
      centagt_ssh_enable: true
      centagt_nrpe_enable: false
    - role: centreon-prov
      centreon_bind_interface: eth1
```

Note : Your host must be member of group **basic-server** in ansible inventory.

 * Deploy centreon agent on server :

```
ansible-playbook centreon-agent.yml
```

After agent deployment, service must appear on Centreon Web interface in **OK** state.
