# Local HPC

## Prerequsites

- Docker Desktop (https://docs.docker.com/engine/install/)
- TablePlus for accessing MySQL (https://www.tableplus.com)

## Building Images

```console
docker pull jupyter/scipy-notebook:latest && docker pull alexandermichels/dummy-jupyterhub:0.0.2 && docker pull mitak2/slurm-docker-cluster:19.05.1 && docker pull mysql:5.7 && docker pull zimoxiao/job_supervisor:latest
```

## Starting the server

```console
cd ~/cybergis-compute-core/docker &&
docker compose up -d
```

## Creating MySQL connection in TablePlus

- Name : Docker DB
- Host : 0.0.0.0
- User : slurm
- Password : password
- Port : 3306
- Database : slurm_acct_db
- SSL mode : DISABLED

## Adding github repo to MySQL server

Once `Job` object is instantiated for the first time, a new table called gits is automatically created in the MySQL server. The following entries need to be filled in if we are interested in running `https://github.com/cybergis/cybergis-compute-hello-world.git`

- id : hello_world
- address : https://github.com/cybergis/cybergis-compute-hello-world.git
- sha : NULL (do not edit)
- isApproved : 1
- isCreatedAt : 1
- isUpdatedAt : 1
- isDeletedAt : NULL (do not edit)
