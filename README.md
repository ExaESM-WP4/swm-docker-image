# Docker images for the Shallow Water Model

This repository contains a docker image to run the [Shallow Water Model](https://git.geomar.de/swm/swm).

## Run the model as a container

To run the model for a specific configuration, the `model.namelist` which contains all configuration need to be available to the model executable. This is achieved by providing the containing directory as a volume to the container. The absolute path to this directory is called `ABS_CONF_PATH` here. This directory must be mounted as `/run` inside the container.

```bash
docker run -v ABS_CONF_PATH:/run martinclaus/swm
```

When running the container, the work directory will be `/run` and all relative paths within the model namelist will be relative to this directory.

Output must be written to some place within the `/run` directory to survive the lifetime of the container.
To avoid cluttering, it is recommended to delete the container automatically after finishing the model run by using the `--rm` flag to `docker run`

## Performance hints

The model make use of shared memory parallelization (aka thread parallelism) via OpenMP.
By default, docker is not binding a container to a particular set of CPUs.
This may cause sever performance penalties, since the container might move between CPUs during runtime.
To avoid this, set the `--cpuset-cpus` [option](https://docs.docker.com/config/containers/resource_constraints/#configure-the-default-cfs-scheduler) to a list or range of cores to be available to the container.
