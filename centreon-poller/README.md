Centreon Poller
=========

Install Centreon poller, git clone plugin available on github and deploy SSH centreon user key file available on central server on poller.

To declare partial configuration of poller in centreon server, a user with admin privileges must exists in centreon Web interface (can be default admin credential).

Requirements
------------

Centreon server must be available before install poller.

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `centreon_server` | localhost | Centreon serveur address |
| `centreon_clapi_user` | clapi | Admin user used to declare partial configuration of poller in central server via CLAPI |
| `centreon_clapi_pass` | changeme | Admin password used to declare partial configuration of poller in central server via CLAPI |

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role. |

Dependencies
------------

This role depends on Apache and PHP.

Example Playbook
----------------

Example to deploy centreon poller :

```yaml
---
- hosts: all
  roles:
    - role: centreon-poller
      centreon_server: centreon-central
      centreon_clapi_user: admin
      centreon_clapi_pass: centreon
```


After installation, poller configuration must be set manually on Centreon web interface with following procedure :

 * Connect to Centreon web interface with admin account and in **Configuration** > **Pollers** > **Broker configuration** menu, click on **Add with wizard**

 * Select **Simple poller** and click **Next** button

 * Enter informations on following fields :

   * Configuration name : _**poller hostname**_ (used No-FQDN) hostname
   * Requester : select _**poller hostname**_
   * Central address : _**centreon central server hostname**_ (used no-FQDN hostname)


 * Click on **Finish** button to validate configuration and in **Broker configuration** menu, activate broker by clicking on **green check** icon

 * In **Engine configuration** menu, edit new poller engine configuration, and in **Data** tab, click on **+ Add a new entry** and enter following value

```
/usr/lib64/centreon-engine/externalcmd.so
```

 * Click on "Save button" to finish poller configuration
