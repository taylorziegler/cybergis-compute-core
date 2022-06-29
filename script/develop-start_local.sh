#!/bin/bash
echo "Stopping existing docker containers"
docker-compose -f ./docker/docker-compose_local_hpc.yml stop

print_usage() {
  echo "-l [OPENCONNECT_URL] -u [OPENCONNECT_USER] -p [OPENCONNECT_PASSWORD] -g [OPENCONNECT_AUTHGROUP]"
}

while getopts 'u:p:g:l:hb' flag; do
  case "${flag}" in
    u) export OPENCONNECT_USER="${OPTARG}" ;;
    p) export OPENCONNECT_PASSWORD="${OPTARG}" ;;
    g) export OPENCONNECT_AUTHGROUP="${OPTARG}" ;;
    l) export OPENCONNECT_URL="${OPTARG}" ;;
    b) export RUN_IN_BACKGROUND="true";;
    h) print_usage
       exit 1 ;;
  esac
done

echo "Running local hpc"
if [[ ! -z "${RUN_IN_BACKGROUND}" ]]; then
  docker-compose -f ./docker/docker-compose_local_hpc.yml up -d --remove-orphans
else
  docker-compose -f ./docker/docker-compose_local_hpc.yml up --remove-orphans
fi