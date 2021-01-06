# Ansible-FlywayDB

## Introduction

This repository is the main repository for Flyway Ansible role.

[Flyway][Flyway] is an open-source database migration tool.

## Role Variables

### Product configuration

| Variable Name | Default Value | Description |
|---------------|---------------|-------------|
| `flywaydb_version` | `5.1.4` |  |
| `flywaydb_source_url` | `https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/5.1.4/flyway-commandline-5.1.4-linux-x64.tar.gz` |  |
| `flywaydb_source_path` | `None` |  |
| `flywaydb_source_subpath` | `flyway-5.1.4` |  |
| `flywaydb_root` | `/opt` |  |
| `flywaydb_name` | `flyway` |  |
| `flywaydb_systemwide_install` | `True` | Ensable SymLink creation into /usr/local/bin  |
| `flywaydb_cluster_migration` | `False` | Run migration on only once for deployments on multiple host groups using same database |
| `flywaydb_debug` | `False` | Disable `no_log` to show sensitive (passwords) in play's log for debug purpose |
| `flywaydb_drivers` | `[]` | SQL Server, MySQL, PostgreSQL, Redshift, H2, Hsql, Derby, SQLite are provided by default |
| `flywaydb_drivers_files` | `[]` |  |
| `flywaydb_reset` | `false` | Drop all existing tables if set  |

### Databases

All databases has to be configured in `flywaydb_databases` dict.

Each dictionnary must at least define the keys described below:

| Variable Name   | Description                                       |
| :------------   | :----------                                       |
| `url`           | JDBC url to use to connect to the database        |
| `user`          | User to use to connect to the database            |
| `password`      | Password to use to connect to the database        |
| `migration_dir` | Directory where SQL sources are to be copied from |

Full variables list can be found on [Configuration reference documentation][Reference]

## Databases version support

| Database Engine | Min version |
| :---            | :---:       |
| PostgreSQL      | 9.3         |
| Oracle          | 12.1        |
| SQL Server      | 2014        |
| DB2             | 10.5        |
| MySQL           | 5.5         |
| MariaDB         | 5.5         |
| PostgreSQL      | 9.3         |
| SAP HANA        | 2.0         |
| HSQLDB          | 2.0         |
| Derby           | 10.11       |


## Dependencies

None.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: all
      roles:
        - role: ansible-flywaydb
          flywaydb_databases:
            testdb:
              url: "jdbc:mysql://localhost:3306/testdb?autoReconnect=true"
              user: "root"
              password: ""
              migration_dir: "data/testdb"
            testdb2:
              url: "jdbc:mysql://localhost:3306/testdb2?autoReconnect=true"
              user: "root"
              password: ""
              migration_dir: "data/testdb2"
            pagila:
              url: "jdbc:postgresql://localhost:5432/postgres"
              user: postgres
              password: ""
              migration_dir: "data/pagila"

## License

MIT

## Author Information

This role is maintained and distributed by Smile's Technical Office.

[//]: # (Bookmarks)

[Flyway]: https://flywaydb.org/
[Reference]: https://flywaydb.org/documentation/configfiles
