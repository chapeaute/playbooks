NodeJS
=========

Install and configure NodeJS server

Requirements
------------

None.

Role Variables
--------------

Variable | Default value |Description
---------|---------------|--------------
`nodejs_data_dir` | /var/lib/nodejs | Default nodejs application data dir
`nodejs_version` | 8.2.1 | Default nodejs version to install
`nodejs_port` |  | Nodejs application port
`nodejs_npm_packages` | []  | NPM packages to install
`nodejs_npm_global_packages` | []  | NPM packages to install globally
`nodejs_install_pm2` | False | Deploy global pm2 npm package. It's should be true if you want to start nodejs as a service
`nodejs_env` |  | Specify environment variable value for NODE\_ENV
`nodejs_logrotate_rotate` | 14 | Log retention



Deploy NodeJS Application
--------------
Application must be deploy in **~nodejs/apps/** directory with one directory by application. Javascript name must be application name.

For example :

```bash
$ mkdir -p ~nodejs/apps/helloworld
$ cd ~nodejs/apps/helloworld
```

```bash
$ npm init
This utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help json` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg>` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
package name: (helloworld)
version: (1.0.0)
description:
entry point: (index.js) helloworld.js
test command:
git repository:
keywords:
author:
license: (ISC)
About to write to /srv/nodejs/apps/helloworld/package.json:

{
  "name": "helloworld",
  "version": "1.0.0",
  "description": "",
  "main": "helloworld.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}


Is this ok? (yes)
```

```bash
$ echo "const express = require('express')
const app = express()
app.get('/', (req, res) => res.send('Hello World!'))
app.listen(8080, () => console.log('Example app listening on port 8080 !'))" > helloworld.js
```

```bash
$ pm2 start helloworld.js
$ pm2 save
```

Dependencies
------------

None.

Example Playbook
----------------

```yml
    - hosts: servers
      roles:
         - role: nodejs
           # nodejs_port: 8080 # open nodejs port in firewall
```


Scripts
-------

Following scripts are available :

 * **nodejs-app-create** : Create new application with **name** and **port**

```bash
# nodejs-app-create -n helloworld -p 8080
```

 * **nodejs-app-delete** : Remove existing application

```bash
# nodejs-app-delete helloworld
```

 * **nodejs-app-deploy** : Deploy new version of application source

```bash
# nodejs-app-deploy -n helloworld -f /tmp/helloworld.tar.gz
```

 * **nodejs-app-info** :

```bash
# nodejs-app-info helloworld
```

 * **nodejs-app-list** : Display list of all running application

```bash
# nodejs-app-list
```

 * **nodejs-app-logs** : Display logs of application

```bash
# nodejs-app-logs helloworld
```

 * **nodejs-app-restart** : Restart application

```bash
# nodejs-app-stop helloworld
```

 * **nodejs-app-start** : Start application

```bash
# nodejs-app-start helloworld
```

 * **nodejs-app-status** : Display details informations of application

```bash
# nodejs-app-status helloworld
```

 * **nodejs-app-stop** : Stop application

```bash
# nodejs-app-stop helloworld
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
```

Docs on testing:
https://molecule.readthedocs.io


License
-------

BSD

Author Information
------------------

* Sebastien Giraud <segir@smile.ci>
* Jean-Vincent KASSI <jekas@smile.ci>
