#!/bin/bash

ENVIRONMENT="$1"
ENVIRONMENT_PATH="/etc/puppetlabs/code/environments"

sha=$(git --git-dir "/${ENVIRONMENT_PATH}/${ENVIRONMENT}/.git" rev-parse HEAD)
message=$(git --git-dir "/${ENVIRONMENT_PATH}/${ENVIRONMENT}/.git" log -1 --pretty='%s')
remote=$(git --git-dir "/${ENVIRONMENT_PATH}/${ENVIRONMENT}/.git" config --get remote.origin.url)
url=$(echo "${remote}"| awk -F'[@:]' '{ sub(/.git$/,"");print "http://"$2"/"$3}')

echo "[${message}](${url}/tree/${sha})"
