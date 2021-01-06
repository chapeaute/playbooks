Centreon Provisionning
=========

This declare host on centreon server

Requirements
------------

For auto-provisionniong, a operationnal Centreon server is required with admin account privileges used by CLAPI for hosts and service creation.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_server` | 127.0.0.1 | Centreon server address (IP or FQDN) |
| `centreon_poller` | [ '`centreon_server`' ] | Centreon poller list to used |
| `centreon_poller_exclude` |  | Poller list to exclude for provisionning |
| `centreon_bind_addr` | ansible_default_ipv4.address | Address to use to contact host agent |
| `centreon_bind_interface` |  | If defined, Centreon monitor host on IP address defined on this interface and override variables `centreon_bind_addr`. Otherwise it use default ipv4 address |
| `centreon_force_prov` | false | Force configuration regeneration of all hosts |
| `snmp_community` |  | SNMP community to used |
| `snmp_version` |  | SNMP version to used |


CLAPI configuration parameters :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_clapi_conf` | /etc/centreon/clapi.conf | Default CLAPI configuration file containing credentials used to log in Centreon (must be a valid user declared in Centreon with admin privileges) |
| `centreon_clapi_user` | admin | Centreon username used by CLAPI |
| `centreon_clapi_pass` | changeme | Centreon password used by CLAPI |

Disk auto-discovery parameters :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_disk_plugin` | /usr/lib/nagios/plugins/check_centreon_snmp_remote_storage | Disk plugin used to auto discover disk |
| `centreon_disk_svc_tpl` | OS-Linux-Disk-Generic-Id-SNMP-custom | Template to used when new disk service must be created |
| `centreon_disk_svc_prefix` | Sys-Disk- | Prefix to append to service name during new service disk creation |
| `centreon_disk_svc_macro` | DISKID | Macro name to update with disk identifier |
| `centreon_disk_svc_macro_extra` |  | Extra macro name and value to override (if exist) or create new macro with specified value (syntax: MACRONAME1=value1&#124;MACRONAME2=value2) |
| `centreon_disk_exclude` | /dev/shm,/run.*,/sys/fs/cgroup | Disk device list to exclude |


Interface auto-discovery parameters :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_traffic_plugin` | /usr/lib/nagios/plugins/check_centreon_snmp_traffic | Traffic plugin used to auto discover interface |
| `centreon_traffic_svc_tpl` | OS-Linux-Traffic-Generic-Id-SNMP-custom | Template to used when new interface service must be created |
| `centreon_traffic_svc_prefix` | Sys-Traffic- | Prefix to append to service name during new service interface creation |
| `centreon_traffic_svc_macro` | INTERFACEID | Macro name to update with interface identifier |
| `centreon_traffic_svc_macro_extra` |  | Extra macro name and value to override (if exist) or create new macro with specified value (syntax: MACRONAME1=value1&#124;MACRONAME2=value2) |
| `centreon_traffic_exclude` | vnet* | Interface device list to exclude |


Bacula Jobs auto-discovery parameters :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_backup_dir_group` | bacula-dir | Ansible group inventory containing all bacula-director server |
| `centreon_backup_plugin` | /usr/lib/nagios/plugins-agent/disco_bacula_jobs | Bacula director jobs auto discovery plugin |
| `centreon_backup_svc_tpl` | App-Backup-Bacula-FD-SSH | Template to used when new joabs service must be created |
| `centreon_backup_svc_prefix` | Svc-Backup- | Prefix to append to service name during new service jobs creation |
| `centreon_backup_svc_macro` | FD | Macro name to update with Bacula client job name |
| `centreon_backup_svc_macro_extra` |  | Extra macro name and value to override (if exist) or create new macro with specified value (syntax: MACRONAME1=value1&#124;MACRONAME2=value2) |
| `centreon_backup_exclude` | | Jobs to exclude |
| `centreon_backup_ssh_user` | centreon | SSH remote user to be used to connect to director |


Mule-ESB applications auto-discovery parameters :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_muleesb_dir_group` | muleesb | Ansible group inventory containing all Mule ESB server |
| `centreon_muleesb_plugin` | /usr/lib/nagios/plugins-agent/disco_muleesb_apps | Mule ESB applications auto discovery plugin |
| `centreon_muleesb_svc_tpl` | App-MuleESB-HTTP-Expected-Content-Custom | Template to used when new Mule ESB applications service must be created |
| `centreon_muleesb_svc_prefix` | App-MuleESB- | Prefix to append to service name during new Mule ESB applications service creation |
| `centreon_muleesb_svc_macro` | "APPNAME&#124;APPPORT" | Macro name to update with Mule ESB application name and port |
| `centreon_muleesb_svc_macro_extra` |  | Extra macro name and value to override (if exist) or create new macro with specified value (syntax: MACRONAME1=value1&#124;MACRONAME2=value2) |
| `centreon_muleesb_exclude` | | Applications to exclude |
| `centreon_muleesb_ssh_user` | centreon | SSH remote user to be used to connect to Mule ESB server |


NodeJS applications auto-discovery parameters :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_nodejs_dir_group` | nodejs | Ansible group inventory containing all NodeJS server |
| `centreon_nodejs_plugin` | /usr/lib/nagios/plugins-agent/disco_nodejs_apps | NodeJS applications auto discovery plugin |
| `centreon_nodejs_svc_tpl` | App-NodeJS-HTTP-Expected-Content-Custom | Template to used when new NodeJS applications service must be created |
| `centreon_nodejs_svc_prefix` | App-NodeJS- | Prefix to append to service name during new NodeJS applications service creation |
| `centreon_nodejs_svc_macro` | "APPNAME&#124;APPPORT" | Macro name to update with NodeJS application name and port |
| `centreon_nodejs_svc_macro_extra` |  | Extra macro name and value to override (if exist) or create new macro with specified value (syntax: MACRONAME1=value1&#124;MACRONAME2=value2) |
| `centreon_nodejs_exclude` | | Applications to exclude |
| `centreon_nodejs_ssh_user` | centreon | SSH remote user to be used to connect to NodeJS server |


| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_tomcat_dir_group` | tomcat | Ansible group inventory containing all Tomcat server |
| `centreon_tomcat_plugin` | /usr/lib/nagios/plugins-agent/disco_tomcat_apps | Tomcat applications auto discovery plugin |
| `centreon_tomcat_svc_tpl` | App-Tomcat-HTTP-Expected-Content-Custom | Template to used when new Tomcat applications service must be created |
| `centreon_tomcat_svc_prefix` | App-Tomcat- | Prefix to append to service name during new Tomcat applications service creation |
| `centreon_tomcat_svc_macro` | "APPNAME" | Macro name to update with Tomcat application name |
| `centreon_tomcat_svc_macro_extra` |  | Extra macro name and value to override (if exist) or create new macro with specified value (syntax: MACRONAME1=value1&#124;MACRONAME2=value2) |
| `centreon_tomcat_exclude` | host-manager,manager,ROOT | Applications to exclude |
| `centreon_tomcat_ssh_user` | centreon | SSH remote user to be used to connect to Tomcat server |


Apache applications auto-discovery parameters :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_apache_dir_group` | apache | Ansible group inventory containing all Apache server |
| `centreon_apache_plugin` | /usr/lib/nagios/plugins-agent/disco_apache_vhost | Apache applications auto discovery plugin |
| `centreon_apache_svc_tpl` | App-Apache-vHost-Expected-Content-Custom | Template to used when new Apache applications service must be created |
| `centreon_apache_svc_prefix` | App-Apache- | Prefix to append to service name during new Apache applications service creation |
| `centreon_apache_svc_macro` | "APPNAME&#124;APPPORT&#124;APPPROTO" | Macro name to update with Apache application name, port and protocol (http or https) |
| `centreon_apache_svc_macro_extra` |  | Extra macro name and value to override (if exist) or create new macro with specified value (syntax: MACRONAME1=value1&#124;MACRONAME2=value2) |
| `centreon_apache_exclude` | | Applications to exclude |
| `centreon_apache_ssh_user` | centreon | SSH remote user to be used to connect to Apache server |


 * Manage centreon resource :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| centreon_rsc |  | List of resource name and value to manage |
| centreon_rsc.name |  | Macro name to create/update |
| centreon_rsc.value |  | Macro value |


```yaml
centreon_rsc:
  - name: USER1
    value: /usr/lib/nagios/plugins
  - name: SSHUSER
    value: "{{ centagt_ssh_user }}"
  - name: CENTREONPLUGINS
    value: /usr/lib/centreon/plugins
  - name: AGENTPLUGINS
    value: "{{ centagt_plugin_dir }}"
```

 * Manage centreon host macro :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| centreon_mcr_host |  | List of host macro to manage |
| centreon_mcr_host.template |  | Template name to update |
| centreon_mcr_host.name |  | Macro name of template to create/update |
| centreon_mcr_host.value |  | Macro value |

```yaml
centreon_mcr_host:
  - template: App-DB-MySQL-SSH
    name: MYSQLUSERNAME
    value: "{{ monitoring_nagios_db_user|default('nagios') }}"
  - template: App-DB-MySQL-SSH
    name: MYSQLPASSWORD
    value: "{{ monitoring_nagios_db_pass|default('changeme') }}"
```

 * Manage centreon service macro :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| centreon_mcr_host |  | List of service macro to manage |
| centreon_mcr_host.template |  | Template name to update |
| centreon_mcr_host.name |  | Macro name of template to create/update |
| centreon_mcr_host.value |  | Macro value |

```yaml
centreon_mcr_svc:
  - template: App-Protocol-DNS-Request-Custom
    name: SEARCH
    value: smile.ci
```


 * Definition of association between ansible group and centreon host group :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_host_grp` |  | Array list of inventory group name and hostgroup to apply to host |
| `centreon_host_grp.name` |  | Ansible inventory group name |
| `centreon_host_grp.template` |  | Host group in centreon to apply to host |


```yaml
centreon_host_grp:
  - name: "ovh"
    template: "Site-OVH"
  - name: "rp"
    template: "Site-RP"
```

 * Definition of association between ansible group and centreon template :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_host_tpl` |  | Array list of inventory group name and monitoring template to apply to host |
| `centreon_host_tpl.name` |  | Ansible inventory group name  |
| `centreon_host_tpl.template` |  | Host template in centreon to apply to host |

```yaml
centreon_host_tpl:
  - name: apache
    template: Servers-Apache-SSH
  - name: basic-server
    template: OS-Linux-SNMP
```


Dependencies
------------

None.

Example Playbook
----------------

Example provisionning host in Centreon configuration :

```yaml
---
- hosts: centreon-prov
  roles:
    - role: centreon-prov
      centreon_server: centreon.labs.lan
      centreon_bind_interface: eth1
      centreon_host_grp:
        - name: "ovh"
          hostgroup: "Site-OVH"
        - name: "smile"
          hostgroup: "Site-Smile"
      centreon_mcr_host:
        - template: App-DB-MySQL-SSH
          name: MYSQLPASSWORD
          value: y7wdeWI2rRvHz5wP
      centreon_host_tpl:
        - name: centreon-agent
          template: OS-Linux-SNMP
        - name: apache
          template: Servers-Apache-SSH
        - name: mariadb
          template: Servers-MariaDB-SSH
```

Multi pollers example :

 * Content of inventory files :

```
[centreon-agent]
server1
server2
server3

[dc1]
server1

[dc2]
server2
server2
```

 * Content of _group\_vars/dc1_ file :

```yaml
centreon_poller: [ 'Poller-DC1' ]
```

 * Content of _group\_vars/dc2_ file :

```yaml
centreon_poller: [ 'Poller-DC2' ]
```

 * Playbook example (same as before) :

```yaml
---
- hosts: centreon-prov
    - role: centreon-prov
      centreon_bind_interface: eth1
      centreon_mcr_host:
        - template: App-DB-MySQL-SSH
          name: MYSQLPASSWORD
          value: y7wdeWI2rRvHz5wP
      centreon_host_tpl:
        - name: centreon-agent
          template: OS-Linux-SNMP
        - name: apache
          template: Servers-Apache-SSH
        - name: mariadb
          template: Servers-MariaDB-SSH
```
