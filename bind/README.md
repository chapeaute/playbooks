Bind
========

This role install a bind server.

Requirements
------------

Package `python-netaddr` needed to be installed on ansible controller.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `bind_version` | bind | Version to display to client |
| `bind_address` | [ '127.0.0.1', '192.168.0.0/16', '172.16.0.0/12', '10.0.0.0/8' ] | Subnet on with server bind |
| `bind_dnssec_enable` | false | Enable or disable DNS security |
| `bind_recursion` | true | Enable or disable DNS recursion (only necessary if DNS server have a resolver function) |
| `bind_forwarders` | [ ] | List of forwarders servers |
| `bind_allow_transfert` | [ 'none' ] | Allowed host list for transfert |
| `bind_allow_notify` | `bind_allow_transfert` | Allowed host list for notify |
| `bind_also_notify` | `bind_allow_transfert` | Also notify this hosts when zone modification are detected |
| `bind_allow_recursion` | ['clients'] | Allowed host list for recursive DNS query |
| `bind_allow_query` | ['clients'] | Allowed host list for query RR |
| `bind_allow_query_cache` | ['clients'] | Allowed host list for query RR in cache |
| `bind_extra_options` | {} | Add custom extra configurations in options section |
| `bind_ddns_enable` | false | Enable Dynamic DNS Update |
| `bind_ddns_key_name` | domain.lan | DDNS key name |


Bind ACL variables :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `bind_acl` | _**clients**_ | Dict of ACL groupe name |
| `bind_acl.clients` | [ '127.0.0.1', '10.0.0.0/8', '172.16.0.0/12', '192.168.0.0/16'] | ACL list of IP address |


Example :

```yaml
    bind_allow_recursion: ['client', 'admin' ]
    bind_allow_query: ['client', 'admin' ]
    bind_allow_query_cache: ['client', 'admin' ]
    bind_acl:
      client:
        - 172.16.3.221/32
        - 172.16.3.222/32
        - 160.120.0.0/16
        - 160.154.0.0/15
      admin:
        - 127.0.0.1
        - 192.168.0.0/16
        - 172.16.18.0/24
```


Bind zone variables :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `bind_zone_dft_servers` | _**not defined**_ | Default servers list of zone if no one was  name with prefix of this DNS zone |
| `bind_zone_dft_soa_server` | _**not defined**_ | Global SOA server name to apply to SOA field in zone file if no one was defined in `bind_zone` and if you don't want it to be automatically generated |
| `bind_zone_dft_soa_mail` | _**not defined**_ | Global SOA mail address to apply to SOA field in zone file if no one was defined in `bind_zone` and if you don't want it to be automatically generated |
| `bind_zone_conf_manage` | false | Manage zone declaration configuration file in /etc/named/zone |
| `bind_zone_file_include` | true | Automatically include `named.conf.zone` in bind main configuration file `/etc/named.conf` |
| `bind_zone` |  | Dictionary with zone informations needed to create it. Create a specific configuration file in {{ bind_conf_dir }}/zone/domain.name.conf and zone files in {{ bind_cache_dir}}/{db.domain.name,db.reverse}. Dictionary key is domain name of DNS zone defined in `bind_zone` |
| `bind_zone.state` |  | Set to `absent` if zone must be removed |
| `bind_zone.subnet` |  | Subnet with prefix of this DNS zone |
| `bind_zone.servers` |  | Array list of DNS servers for this zone. First server of list is the master, second server is the slave |
| `bind_zone.soa_server` |  | SOA server name to defined for this zone. Default, is to automatically defined it with DNS zone name, if possible. |
| `bind_zone.soa_mail` |  | SOA mail address to defined for this zone. Default, is to automatically defined it with DNS zone name, if possible. |

**Note** : Role determine automatically if server is master, slave or a forwarder of zone depending if one of this ipv4 addresses is in the **bind_zone.servers** list :

  * If first address of bind_zone.servers list is one of the ipv4 addresses of the server, then server is **master**
  * If second address of bind_zone.servers list is one of the ipv4 addresses of the server, then server is **slave**
  * Otherwise, server is a **forwarder**

**bind_zone.servers** items can include server name to be include in zone file instead of nsX.

Example :

```yaml
  bind_zone:
    dev.smile.lan:
      subnet: 10.1.1.0/24
      servers: [ '10.3.1.2:ns-int-1', '10.3.1.3:ns-int-2' ]
```


Server can be exclude in zone file declaration by adding '**-**' ahead server name. In this example *ns-int-1* is master of zone but no entry in *dev.smile.lan* zone file will reference this server as server name for this domain.

```yaml
  bind_zone:
    dev.smile.lan:
      subnet: 10.1.1.0/24
      servers: [ '10.3.1.2:-ns-int-1', '10.3.1.3:ns-int-2' ]
```

Dependencies
------------

None.

Example Playbook
----------------

Simple example for DNS cache server only :

```yaml
---
- hosts: all
  roles:
   - bind
```


Simple example for DNS autority server :

```yaml
---
- hosts: bind
  roles:
  - role: bind
    bind_allow_transfert: [ '10.2.1.3' ]
    bind_zone_conf_manage: true
    bind_zone:
      ovh.smile.lan:
        subnet: 10.2.1.0/24
        servers: [ '10.2.1.2', '10.2.1.3' ]
```



Simple example with zone configuration file declaration for master DNS host and DDNS support :

```yaml
---
- hosts: bind
  roles:
  - role: bind
    bind_ddns_enable: true
    bind_ddns_key_name: smile.lan
    bind_allow_transfert: [ '10.2.1.3' ]
    bind_zone_conf_manage: true
    bind_zone:
      ovh.smile.lan:
        subnet: 10.2.1.0/24
        servers: [ '10.1.1.2', '10.1.1.3' ]
```


Simple example with zone configuration file declaration for master DNS host and DDNS support. **ns-int-1** and **ns-int-2** will be used to defined server name respectivly for **10.1.1.2** and **10.1.1.3** :

```yaml
---
- hosts: bind
  roles:
  - role: bind
    bind_address: [ '127.0.0.1', '10.1.0/24' ]
    bind_ddns_enable: true
    bind_ddns_key_name: smile.lan
    bind_allow_transfert: [ '10.2.1.3' ]
    bind_zone_conf_manage: true
    bind_zone:
      rp.smile.lan:
        subnet: 10.1.1.0/24
        servers: [ '10.1.1.2:ns-int-1', '10.1.1.3:ns-int-2' ]
      ovh.smile.lan:
        subnet: 10.2.1.0/24
        servers: [ '10.1.1.2:ns-int-1', '10.1.1.3:ns-int-2' ]
```

Complexe example :

```yaml
---
- hosts: all
  roles:
  - role: bind
    bind_ddns_enable: true
    bind_ddns_key_name: dev.smile.lan
    bind_zone_conf_manage: true
    bind_zone_dft_soa_server: ocit.dev.smile.lan.
    bind_zone_dft_soa_mail: admin.dev.smile.lan.
    bind_extra_options:
      max-ncache-ttl: 3600
    bind_zone:
      dev.smile.lan:
        servers: [ '192.168.122.181:-ns-int.dev.smile.lan', '192.168.22.182:ns2.dev.smile.lan', '192.168.122.183:', '192.168.12.183:yakro.aviso.ci' ]
      122.168.192.in-addr.arpa:
        soa_mail: exploit.dev.smile.lan.
        soa_server: yakro.dev.smile.lan.
        servers: [ '192.168.122.181:ns1.dev.smile.lan', '192.168.122.182:ns2.dev.smile.lan', '192.168.12.183:yakro.aviso.ci' ]
```

File generated by this playbook :

##### /var/named/db.dev.smile.lan

```
$TTL 14400
@       IN      SOA     ocit.dev.smile.lan.   admin.dev.smile.lan. (
                        2016052601      ; Serial
                        10800           ; Refresh 3 hours
                        3600            ; retry 1 hour
                        604800          ; expire 1 week
                        600 )           ; min TTL 1 day

        IN	NS	ns2.dev.smile.lan.
        IN	NS	ns3.dev.smile.lan.
        IN	NS	yakro.aviso.ci.

ns2     IN	A	192.168.22.182
ns3     IN	A	192.168.122.183
```

##### /var/named/db.122.168.192.in-addr.arpa

```
$TTL 14400
@       IN      SOA     yakro.dev.smile.lan.   exploit.dev.smile.lan. (
                        2016052601      ; Serial
                        10800           ; Refresh 3 hours
                        3600            ; retry 1 hour
                        604800          ; expire 1 week
                        600 )           ; min TTL 1 day

      IN	NS	ns1.dev.smile.lan.
      IN	NS	ns2.dev.smile.lan.
      IN	NS	yakro.aviso.ci.

181   IN	PTR     ns1.dev.smile.lan.
182   IN	PTR     ns2.dev.smile.lan.
```
