Postfix
=========


This role deploy postfix mail agent.

Requirements
------------

None.

Variables
------------

Default variables are defined in defaults/ and vars/ directory.

Variable | Default value |Description
---------|---------------|------------
 `postfix_myhostname` | `ansible_fqdn` | Fully qualify server hostname
 `postfix_myorigin` | $myhostname | Domain name used for mail sender appears to come from
 `postfix_mydomain` | $myhostname | Server domain name used to on many postfix configuration
 `postfix_relayhost` | | Host used to relay outgoing mail
 `postfix_relay_domains` | [] | Domains to relay / mx backup
 `postfix_mynetworks` | [ "127.0.0.0/8", "[::ffff:127.0.0.0]/104", "[::1]/128" ] | Allowed to received mail from this network
 `postfix_inet_interfaces` | loopback-only | Interface list to bind
 `postfix_mydestination` | [ "$mydomain", "$myhostname", "localhost.$mydomain", "localhost" ] | Specifies the list of domains that this machine considers itself the final destination for.
 `postfix_local_user_relay_address` | [] | Relay all mail going to local users (e.g. root or cron) to another mail address
 `postfix_rewrite_sender_address` | | Useful if you use a SMTP server for relay that doesn't allow arbitrary sender addresses
 `postfix_local_recipient_map` |  |
 `postfix_generic_maps` | |


Sample playbooks
---------------

Example:

```yaml
- hosts: all
  roles:
    - role: postfix
```

```yaml
- hosts: all
  roles:
    - role: postfix
      postfix_mydomain: "{{ foreman['domain_name'] }}"
      postfix_relayhost: smtp.smile.lan
      postfix_local_user_relay_address:
        - support-systeme@smile.ci
```

MX Backup

```yaml
- hosts: all
  roles:
    - role: postfix
     postfix_relay_domains:
        - smile.ci
        - scs-pro.com

```
