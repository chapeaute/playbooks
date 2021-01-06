IPSEC
=====

Install ipsec server and configure tunnels

Requirements
------------

You must install **netaddr** on your local machine

```bash
sudo pip install netaddr
```

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `ipsec_tunnels` | [] | Array of ipsec tunnels |
| `ipsec_tunnels.subnets` | [**mandatory 1**, **mandatory 2**]  | Array of subnets |
| `ipsec_tunnels.name` | default | Name of ipsec tunnel |
| `ipsec_tunnels.secret` | hash 256 of tunnel.name | Shared secret of tunnel ip |
| `ipsec_tunnels.groups` |  | Array of tunnels servers |
| `ipsec_tunnels.params` |  | hash of additionals tunnel parameters |

 `ipsec_tunnels.params` :  list of key/value ipsec tunnel params

```YAML
ipsec_default_params:
  auto: start    # Auto start tunnel when service start
  authby: "secret" # Use secret to authenticate servers
  dpdaction: "restart" # Action when remote peer seems dead
  dpddelay: 30s # Delay before sending new keep alive packets
  dpdtimeout: 120s   # Timeout before considering the remote peer dead
  pfs: "no"   # Disable perfect forward secrecy
  type: "tunnel" # Type of connecion
  ike: aes256-sha1-modp1024 # Encryption Algorithms
  keylife: 3600s  # key length
  aggrmode: "no" # Aggressive mode
  ikelifetime: 1h # Key length
  salifetime: 1h  #
  esp: aes256-sha1 # Mode of encryption
  keyexchange: ike
```

Dependencies
------------

None

Example Playbook
----------------

A simple example on how to use this module to interconnect two servers

```YAML
---
- hosts: vpn-servers
  roles:
    - role: ipsec
      ipsec_tunnels:
      - name: smile-ovh
        subnets:
          - 10.100.60.0/23
          - 10.2.1.0/16
```

If only one part of the tunnel is configurable by ssh. You can configure it like that

```YAML
- hosts: servers
  roles:
    - role: ipsec
      ipsec_tunnels:
      - name: smile-ovh
        params:
          - right: 156.89.3.56 # Remote serveur ip
        subnets:
          - 10.100.60.0/23
          - 10.2.1.0/16
```

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI (jekas@smile.ci)
