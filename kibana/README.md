Kibana
=========

This role install a Kibana server

Requirements
------------

No requirements

Role Variables
--------------

Default variables are defined in defaults/ and vars/ directory :

### Global config

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `use_satellite_repo` | false | Use official internet repository to install package of this role. In case host have no internet access and package must be install from a local satellite, set this option to `true`. Repository must be previously declare in satellite and VM must be register to it before deploy this role. |

### General config

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `kibana_version` | "7.4" | Kibana version to deployed |
| `kibana_server_port` | 5601 | Enable feature on kibana UI |
| `kibana_server_host` | 0.0.0.0 | Interface list kibana bind |
| `kibana_elasticsearch_host` | localhost | ES host address |
| `kibana_elasticsearch_port` | 9200 | ES host port |
| `kibana_deploy_dashboard` | True | Deploy dashboard examples (freeradius, postfix, http, main) |
| `kibana_reverse_vhost_name` | kibana | Default apache vhost name for reverse proxy |
| `kibana_enable_http_reverse` | True | Deploy kiabana with apache reverse proxy |
| `firewall_setup` | True | Define if rôle open kibana port, firewall_type must be defined is True |
| `firewall_type` | firewalld | Define which firewall is configured |

### X-Pack config

| Variable | Default value | Description |
| -------- | ------------- | ----------- |
| `kibana_xpack_security_enabled` | false | Enable security on kibana UI |
| `kibana_xpack_infra_enabled` | false | Enable infrastructure on kibana UI |
| `kibana_xpack_graph_enabled` | false | Enable graph on kibana UI |
| `kibana_xpack_reporting_enabled` | false | Enable reporting on kibana UI |
| `kibana_xpack_apm_enabled` | false | Enable apm on kibana UI |
| `kibana_xpack_ml_enabled` | false | Enable ML on kibana UI |

Dependencies
------------

None.

Example Playbook
----------------

Simple example for kibana 5 :

```yaml
---
- hosts: kibana
  roles:
    - role: Kibana
```

Simple example for kibana 6 :

```yaml
---
- hosts: kibana
  roles:
    - role: Kibana
      kibana_version: "7.4"
```

Example with connection to a remote ES serveur :

```yaml
---
- hosts: kibana
  roles:
   - role: kibana
     kibana_elasticsearch_host: "elasticsearch"
```

Complete example for ELK stack 5.x standalone server (Filebeat -> Logstash -> Elasticsearch -> Kibana) :

```yaml
---
- hosts: elk-server
  roles:
    - role: elasticsearch
      es_cluster_name: elk
      es_install_curator: true
      es_install_admin_scripts: true
      es_shard_count: 6
      es_heap_size_prct: 0.45
      es_path_data: "/srv/elasticsearch/data"
      es_path_logs: "/srv/elasticsearch/logs"
      es_path_repo: "/srv/elasticsearch/repo"
    - role: logstash
      ls_input_beat: true
      ls_output_elasticsearch: true
      ls_heap_size_prct: 0.35
    - role: kibana
```


Complete example for ELK stack 5.x multi server (Filebeat -> Kafka -> Logstash -> Elasticsearch -> Kibana) :

```yaml
---
- hosts: elasticsearch
  roles:
    - role: elasticsearch
      es_cluster_name: elk
      es_hosts: "{{ groups['elasticsearch'] }}"

- hosts: kafka
  roles:
    - role: kafka
      zk_hosts: "{{ groups['kafka'] }}"

- hosts: logstash
  roles:
    - role: logstash
      ls_input_kafka: true
      ls_kafka_hosts: "{{ groups['kafka'] }}"
      ls_output_elasticsearch: true
      ls_elasticsearch_hosts: "{{ groups['elasticsearch'] }}"

- hosts: kibana
  roles:
    - role: kibana
      kibana_elasticsearch_host: "elastic"

- hosts: filebeat
  roles:
    - role: filebeat
      fb_kafka_hosts: "{{ groups['kafka'] }}"
      applications:
        - name: basic-server
          files:
            - /var/log/messages
            - /var/log/secure
            - /var/log/dmesg
            - /var/log/cron
```

**Note** : Kibana must be accessible by URL http://localhost:5601

## Tools

2 scripts ont été développés pour préparer les dashboards qui pourront ensuite être importé facilement dans Kibana avec Ansible à partir d'un export complet réalisé depuis l'interface d'administration d'un serveur Kibana de référence.

Pour réaliser un export complet depuis l'interface d'administration de Kibana, se connecter sur le serveur Kibana disposant des dashboards à exporter, puis dans le menu **Management** > **Saved Objects**, cliquer sur le bouton **Export Everything**. Enregistrer ensuite le fichier sur votre disque qui devrait porter par défaut le nom **export.json**.

Ce fichier pourra ensuite être utilisé par les deux scripts ci-dessous pour lister tous les dashboards présents.


## kibana-dashboard-list

Ce script liste tous les objets contenus dans un export full de Kibana.

#### Utilisation

``` bash

kibana-dashboard-list $(export.json)

```

#### Options

* **--dashboard** : Liste uniquement les objets de type dashboard
* **--search** : Liste uniquement les objets de type search
* **--visualization** : Liste uniquement les objets de type visualization

**Note** : Si aucune option n'est spécifiée, tout est affiché

#### Exemples

Exemple ou la commande est exécutée sans option, tous les objets sont affichés :

``` bash
$ kibana-dashboard-list ../EXPORT/export-everything.json

Available dashboard:
- Main dashboard ( id = 424efde0-fc38-11e6-a0d5-47dd1b4f5874)
- HTTP Dashboard ( id = 6c3d14c0-fc7e-11e6-9eae-8daedfcd2395)
Available visualization:
- Log source
- Log host count
- Host repartition
- HTTP Return Code
- HTTP Client IP repartition
- HTTP User Agent
- HTTP Map
- HTTP Request Count
- Host repartition by time
- Total log count
- Host count
- HTTP Vhost repartition
Available search:
- HTTP Search
- Global log
```

Exemple avec uniquement les dashboard :

``` bash
$ kibana-dashboard-list ../EXPORT/export-everything.json --dashboard

Available dashboard:
- Main dashboard
- HTTP Dashboard
```

Exemple avec uniquement les search :

``` bash
$ kibana-dashboard-list ../EXPORT/export-everything.json --search

Available search:
- HTTP Search
- Global log
```

Exemple avec uniquement les visualization :

``` bash
$ kibana-dashboard-list ../EXPORT/export-everything.json --visualization

Available visualization:
- Log source
- Log host count
- Host repartition
- HTTP Return Code
- HTTP Client IP repartition
- HTTP User Agent
- HTTP Map
- HTTP Request Count
- Host repartition by time
- Total log count
- Host count
- HTTP Vhost repartition

```


## kibana-dashboard-extract

Ce script permet de convertir les exports Kibana (export complet) en plusieurs fichiers.
L'intérêt étant de pouvoir avoir une arborscence de fichier qu'Ansible va pouvoir importer facilement dans un kibana.

#### Utilisation

``` bash
kibana-dashboard-extract --dashboard $(dashboard-uuid) $(export_file) $(dashboard_name)
```
#### Options

* **--dashboard dashboard_uuid** : UUID du dashboard à exporter (Récuperation via le script kibana-dashboard-list)
* **export_file** : Fichier au format JSON contenant l'export complet avec tous les dashboard
* **dashboard_name** : Nom du dossier dans lequel les fichiers vont être extrait

#### Exemple

``` bash
kibana-dashboard-extract --dashboard 6c3d14c0-fc7e-11e6-9eae-8daedfcd2395 ~/Downloads/export.json httpd
```

L'arborescence suivante sera créée :

``` bash
httpd
├── dashboard
│   └── 6c3d14c0-fc7e-11e6-9eae-8daedfcd2395.json
├── search
│   └── b5d36360-fc7d-11e6-9eae-8daedfcd2395.json
└── visualization
    ├── 118f4760-fc73-11e6-9eae-8daedfcd2395.json
    ├── 407ef700-fc73-11e6-9eae-8daedfcd2395.json
    ├── 7a290a00-fc72-11e6-9eae-8daedfcd2395.json
    ├── 81105a70-fc73-11e6-9eae-8daedfcd2395.json
    ├── c2c9a270-fc7b-11e6-9eae-8daedfcd2395.json
    ├── eabfdd60-fc73-11e6-9eae-8daedfcd2395.json
    └── f8901140-fc3b-11e6-8b00-d94994d2540d.json
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

```bash
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
