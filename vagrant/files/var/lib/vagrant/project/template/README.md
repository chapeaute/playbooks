Vagrant 
==============

**Note** : Ansible >= 2.1 requis.

## Mise en place de l'environnement

1) Declaration des machines dans le fichiers **servers.json**
2) Mise à jour de l'inventaire **inventory/hosts**
3) Mise à jour du fichier **playbook/main.yml**
4) Mise à jour des playbooks **playbook/\*.yml** inclue dans le **main.yml**
5) Instancier/Démarrer les VM :
```
vagrant up --no-provision
```

6) Déployer la configuration
```
ansible-playbook playbook/main.yml
```


## Déploiement

Pour tester le déploiement avant d'appliquer :
```
ansible-playbook -k playbooks/main.yml --limit server1 -DC
```

Deployer la configuration sur les serveurs haproxy :
```
ansible-playbook -k playbooks/main.yml --limit server1 -DC
```
