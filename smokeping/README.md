Smokeping
=========

This role install and configure smokeping

Requirements
------------

* None

Role Variables
--------------


| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `smokeping_title` | Example Corp Network Latency Grapher | Smokeping Main page title |
| `smokeping_remark` | Welcome to the SmokePing website of Example Company... | Remark
| `smokeping_targets` | [] | Smokeping array of targets
| `smokeping_targets.name` | | Menu name of the group targets |
| `smokeping_targets.title` | | Title page of the group targets |
| `smokeping_targets.hosts` | [] | Array or Dictionary list of the hosts. See example below |

Dependencies
------------

* Apache

Example Playbook
----------------

Sample playbooks

```yml
  - hosts: all
    roles:
      - role: smokeping
        smokeping_title: Example Corp Network Latency Grapher
        smokeping_remark: Welcome to the SmokePing website of Example Company..
        smokeping_targets:
        - name: smokeping target group 1
          title: My group
          hosts:
            - 8.8.8.8
            #- "{{ groups['all']}}
```

Or be more specific with the targets

```yml
  - hosts: all
    roles:
      - role: smokeping
        smokeping_title: Example Corp Network Latency Grapher
        smokeping_remark: Welcome to the SmokePing website of Example Company..
        smokeping_targets:
        - name: smokeping target group 1
          title: Local
          hosts:
            - name: smokeping target host 1
              host: locahost
```


License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>