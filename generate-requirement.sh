#!/bin/bash

roles_path="$(cd "$(dirname "$0")" ; pwd -P)"
git_server=git.smile.ci
git_namespace=adminsys/ansible/role
require_file=requirements.yml

cd $roles_path

echo -n > $require_file

for role in $(git config --file .gitmodules --get-regexp path | awk '{ print $2 }' | sort -n)
do
    cd $roles_path/$role
    tag=$(git describe --abbrev=0 --tags >/dev/null 2>&1 && git describe --abbrev=0 --tags || echo master)
    cd $roles_path

    cat << EOF >> $require_file
- src: git@$git_server:$git_namespace/$role.git
  scm: git
  version: $tag

EOF
done

echo "$roles_path/$require_file"
