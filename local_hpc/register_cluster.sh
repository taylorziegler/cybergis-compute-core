#!/bin/bash
set -e

docker exec slurmctld bash -c "/usr/bin/sacctmgr --immediate add cluster name=linux" && \
docker-compose -f ./docker-compose-local-hpc.yml restart slurmdbd slurmctld
