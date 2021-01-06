ZPUSH
=========

This role can deploy z-push with differents backends.
Only Zimbra is supported for now as a backend. It's the default backend

Requirements
------------

None

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory.

### Global variables

| Variable                | Default value | Description |
| ----------------------  | ------------- | ----------- |
| `zpush_main_version` | 2.3 | Main zpush version |
| `zpush_full_version`  | 2.3.7 | Full zpush version |
| `zpush_timezone`     | Africa/Abidjan | zpush timezone |
| `zpush_html_dir`     | /usr/share/z-push | Zpush html dir     |
| `zpush_log_dir`       | /var/log/z-push      |  Zpush log dir   |


### Backend variable

| `zpush_bakend` | zimbra        | Zpush default backend |
| `zpush_backend_url`      | http://zimbra.example.com    | Zimbra backend url | `zpush_backend_download_url` | https://downloads.sourceforge. net/project/zimbrabackend/Release66/zimbra66.tgz | Zimbra default backend download url |

Dependencies
------------

None

Example Playbook
----------------


```yml
---

- hosts: zpush
  roles:
    - role: zpush
      zpush_backend_url: http://zimra.smile.ci
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

```
molecule verify # lint role
molecule check # dry run
molecule test # launch test from scracth
# You can relaunch test after with existing instances
ansible-playbook playbook
```

Docs on testing:
https://molecule.readthedocs.io

License
-------

BSD

Author Information
------------------

* Jean-Vincent KASSI <jekas@smile.ci>