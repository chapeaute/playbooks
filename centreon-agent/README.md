Centreon Agent
=========

This role install, configure NRPE/SElinux/Firewall

Requirements
------------

None.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_poller` | localhost | Poller list use to autorise agent configuration |
| `centagt_plugin_dir` | /usr/lib/nagios/plugins-agent | Centreon agent plugins directory |
| `centagt_sudo_lines` |  | centreon sudo lines for plugins requiring root privileges |


```
centagt_sudo_lines:
  - "centreon ALL=(ALL) NOPASSWD: {{ centagt_plugin_dir }}/check_bind_stats"
  - "centreon ALL=(ALL) NOPASSWD: {{ centagt_plugin_dir }}/check_mysql_health"
  - "centreon ALL=(ALL) NOPASSWD: {{ centagt_plugin_dir }}/check_bacula_lastbackup"
  - "centreon ALL=(ALL) NOPASSWD: {{ centagt_plugin_dir }}/disco_scan_nrpe_bacula_show"
  - "centreon ALL=(ALL) NOPASSWD: /sbin/bconsole"
```


NRPE parameters :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centagt_nrpe_enable` | true | NRPE actived |
| `centagt_nrpe_bind_address` | 0.0.0.0 | NRPE bind address |
| `centagt_nrpe_allowed_hosts` | `centreon_poller` | Array list of poller host allowed to monitor server |
| `centagt_nrpe_dont_blame` | 1 | Allow NRPE to accept arguments |
| `centagt_nrpe_server_port` | 5666 | NRPE listening port  |
| `centagt_nrpe_enable_sepolicy` | true | Install SELinux policy for NRPE plugins (most of them are for Smile plugins) |

SSH parameters :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centagt_ssh_enable` | false | deploy ssh agent |
| `centagt_ssh_user` | centreon | ssh user used by poller to connect to remote host  |
| `centagt_ssh_keys` | [] | ssh keys used by poller to connect to remote host. If no SSH public key was specified, ansible try to get it from `centreon_poller` list by connecting to server and fetch SSH public key from **centreon-engine** user : |

Dependencies
------------

None.

Example Playbook
----------------

Simple example, installing and configuring NRPE :

``` yaml
---
- hosts: centreon-agent
  roles:
    - role: centreon-agent
      centagt_nrpe_enable: true
      nrpe_allowed_hosts: ['192.168.122.10']
```

Example installing and configuring SSH agent. If no SSH public key was specified, ansible try to get it from `centreon_poller` list by connecting to server and fetch SSH public key from **centreon-engine** user :

``` yaml
---
- hosts: centreon-agent
  roles:
    - role: centreon-agent
      centreon_poller: ['centreon-server', 'centreon-poller']
      centagt_ssh_enable: true
      centagt_nrpe_enable: false

Example with public key :

```yaml
---
- hosts: centreon-agent
  roles:
    - role: centreon-agent
      centagt_ssh_enable: true
      centagt_nrpe_enable: false
      centagt_ssh_keys:
        - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDg6eXbe6l6PLmjOpm9/4CRAMsg78JYKcxijw7YdMWcF1GD5n0mwjiY1ebd/yWWXaL3HM5vlc3NEsowO6dWU/1EqilQbfsxlSnTckUrHW1VlaJOGGeK5W3CewiJ/For663vks9Wxgnv3QqaWG74Yt6WxO9b16Le2S0hqpW7py3WsHSz06UhXsYbXYnv+5+INxYvESYBiqp37byymIVUY+9PQ6rMYorMZDGs+VJYhJCPuCJ7lqpbGBXVB74CWdqkHKzMSPYzmyBDaZtKY7hGaxUF7FRcqVqeEA2nfprcRufLf5xiOzo3tOwQiLtFWUcjSF0Emm6uKAW2igSavCH3b4AV centreon@centreon.ovh.smile.lan
```


Complete example monitoring server by SSH and SNMP :

```yaml
---
- hosts: centreon-agent
  vars:
    centreon_poller: "{{ groups['centreon-poller'] }}"
  roles:
    - role: snmp
      snmp_allow_clients: "{{ centreon_poller }}"
    - role: centreon-agent
      centagt_ssh_enable: true
      centagt_nrpe_enable: false
    - role: centreon-prov
      centreon_bind_interface: eth1
      centreon_host_tpl:
        - name: centreon-agent
          template: OS-Linux-SNMP
        - name: apache
          template: Servers-Apache-SSH
        - name: mariadb
          template: Servers-MariaDB-SSH
```
