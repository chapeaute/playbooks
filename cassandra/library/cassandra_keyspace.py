#!/usr/bin/python
# -*- coding: utf-8 -*-

DOCUMENTATION = '''
---
module: cassandra_keyspace
short_description: keyspace management for cassandra databases
description:
- Adds or removes keyspaces from Cassandra databases

- options:
    login_user:
        description:
            - The username used to connect to the Cassandra database
        required: False
        default: cassandra
    login_password:
        description:
            - The password used with the username to connect to the Cassandra database
        required: False
        default: cassandra
    login_host:
        description:
            - The host that should be used to connect to the Cassandra cluster. Should be one member of the cluster.
        required: False
        default: localhost
    login_port:
        description:
            - The port that will be used to connect to the cluster.
            - This is only required if Cassandra is configured to run on something else than the default port.
        required: False
        default: 9042
    protocol_version:
        description:
            - The protocol the Cassandra cluster speaks.
            - For Cassandra version 1.2 you should set 1
            - For version 2.0 take 1 or 2
            - For version 2.1 take 1,2 or 3
            - Beginning with version 2.2 you can also use 4.
        required: False
        default: 3
    name:
        description:
            - The name of the keyspace
        required: True
    strategy:
        description:
            - The name of the replication strategy. For now only 'SimpleStrategy' is supported
        required: False
        default: SimpleStrategy
        choices: ['SimpleStrategy', 'NetworkTopologyStratey']
    replication_factor:
        description:
            - The number of nodes in case of SimpleStrategy the data should be replicated on
        required: False
        default: 2
    state:
        description:
            - If the user should be present on the system or not. Put 'absent' if you want the user to be removed.
        required: False
        default: present
        choices: ['absent', 'present']
- notes:
    - Requires cassandra-driver for python to be installed on the remote host.
    - @See U(https://datastax.github.io/python-driver) for more information on how to install this driver
    - This module should usually be configured with the 'run_once' option in Ansible since it makes no sense to create the same user from all the hosts
    - According to the Datastax Cassandra documentation you should run 'nodetool repair' on all nodes that are involved after the keyspace was updated.
    - Currently this module only supports the SimpleStrategy for replication. NetworkTopologyStratey will be added soon.

requirements: ['cassandra-driver']
author: "Patrick Kranz"
'''

EXAMPLES = '''
# Create a keyspace 'test_keyspace' with simple strategy and replication factor 3:
- cassandra_keyspace: name=test_keyspace replication_factor=3

# Modify the keyspace 'test_keyspace' to have a replication_factor of 4:
- cassandra_keyspace: name=test_keyspace replication_factor=4

# Drop keyspace 'test_keyspace'
- cassandra_keyspace: name=test_keyspace state=absent

'''

import json

try:
    from cassandra import ConsistencyLevel
    from cassandra.auth import PlainTextAuthProvider
    from cassandra.cluster import Cluster
    from cassandra.query import SimpleStatement
except ImportError:
    cassandra_driver_found = False
else:
    cassandra_driver_found = True

def keyspace_exists(session, keyspace_name):
    result = session.execute("SELECT keyspace_name FROM system_schema.keyspaces WHERE keyspace_name = %s", [keyspace_name]);
    return len(result.current_rows) > 0

def create_keyspace(session, keyspace_name, clazz, replication_factor):
    query = "CREATE KEYSPACE " + keyspace_name + " WITH REPLICATION = { 'class': '" + clazz + "', 'replication_factor': " + replication_factor + " }"
    session.execute(query)

def main():
    module = AnsibleModule(
        argument_spec=dict(
            login_user=dict(required=False),
            login_password=dict(required=False, no_log=True),
            login_host=dict(default='localhost'),
            login_port=dict(default=9042),
            protocol_version=dict(default="3", choices=["1","2","3","4"]),
            state=dict(default='present', choices=['present', 'absent']),
            name=dict(required=True),
            strategy=dict(default='SimpleStrategy', choices=['SimpleStrategy']),
            replication_factor=dict(default=2)
        )
    )

    if not cassandra_driver_found:
        module.fail_json(msg='no cassandra driver for python found. please install cassandra-driver.')

    login_user = module.params['login_user']
    login_password = module.params['login_password']
    login_host = module.params['login_host']
    login_port = module.params['login_port']
    state = module.params['state']
    keyspace = module.params['name']
    clazz = module.params['strategy']
    replication_factor = module.params['replication_factor']

    if login_user is not None and login_password is not None:
        auth_provider = PlainTextAuthProvider(username=login_user, password=login_password)
        cluster = Cluster(contact_points=[login_host], port=login_port,
                        auth_provider=auth_provider, protocol_version=3)
    else:
        cluster = Cluster(contact_points=[login_host], port=login_port, protocol_version=module.params['protocol_version'])

    try:
        session = cluster.connect()

        if state == 'present':
            if not keyspace_exists(session, keyspace):
                create_keyspace(session, keyspace, clazz, replication_factor)
                module.exit_json(changed=True, keyspace=keyspace, msg="Keyspace created")
            else:
                rows = session.execute("SELECT replication FROM system_schema.keyspaces WHERE keyspace_name = %s", [keyspace])
                # module.log(rows[0].replication)
                # module.log("[" + str(rows[0].replication).encode('utf-8', 'ignore') + "]")
                # module.log("[" + str(rows[0].replication) + "]")
                # module.log(json.loads("[" + str(rows[0].replication).encode('ascii', 'ignore') + "]"))
                # module.log(json.loads("[" + str(rows[0].replication)) + "]")
                # module.log(options)
                # options = json.loads(str(rows[0].replication))
                # if options.replication_factor != replication_factor:
                query = "ALTER KEYSPACE " + keyspace + " WITH REPLICATION = { 'class': '" + clazz + "', 'replication_factor': " + replication_factor + " }"
                session.execute(query)
                module.exit_json(changed=True, keyspace=keyspace, msg="Replication factor updated")
        else:
            if keyspace_exists(session, keyspace):
                session.execute("DROP KEYSPACE " + keyspace)
                module.exit_json(changed=True, keyspace=keyspace, msg="Keyspace deleted")

        module.exit_json(changed=False, keyspace=keyspace)
    except Exception as error:
        module.fail_json(msg=str(error))
    finally:
        cluster.shutdown()


from ansible.module_utils.basic import *
if __name__ == '__main__':
    main()
