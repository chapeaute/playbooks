## Fail2ban

Install and configure fail2ban.


## Requirements

None

## Role Variables

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `fail2ban_loglevel`| INFO | Sets the loglevel output |
| `fail2ban_syslog_facility`| 1 | Facility used by syslog to forward log to a specific file |

Fail2ban global parameters :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `fail2ban_ignoreips`| 127.0.0.1/8| Which IP address/CIDR mask/DNS host should be ignored from fail2ban's actions |
| `fail2ban_bantime`| 86400 | Number of seconds that a host is banned |
| `fail2ban_dbpurgeage`| 86400 | Sets age at which bans should be purged from the database |
| `fail2ban_maxretry`| 3 | Maximum number of retries before the host is put into jail |
| `fail2ban_findtime`| 3600 | A host is banned if it has generated fail2ban\_maxretry during the last fail2ban\_findtime |
| `fail2ban_backend`| auto| Specifies the backend used to get files modification |
| `fail2ban_mta`| sendmail| Email action |

Fail2ban jail activation :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `sshd_enable` | true | active jail sshd |
| `ssh-ddos_enable`| true | active jail sshd ddos |
| `dropbear_enable`| true | active jail dropbear |
| `selinux-ssh_enable`| true | active jail selinux-ssh |

## Dependencies

None.

## Example Playbook

Simple example :

```yaml
---
- hosts: all
  roles:
    - fail2ban
```

Complexe example :

```yaml
---
- hosts: all
  roles:
    - fail2ban
      fail2ban_bantime: 86400
      fail2ban_maxretry: 5
      fail2ban_findtime: 3600
```
