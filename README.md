# Docker images for the Shallow Water Model

This repository contains docker images to build and run the [Shallow Water Model](https://git.geomar.de/swm/swm).

## Hierarchy
This repository contains the following images

-  swm_build_env: image based on ubuntu 18.04 containing all the necessary dependencies for building the model. The build image is available at [docker hub](https://hub.docker.com/r/martinclaus/swm_build_env).
-  swm: this image contains the code of the Shallow Water Model. When the container is run, the model is configured, build and run. The image is available at [docker hub](https://hub.docker.com/r/martinclaus/swm) where different branches are available as tags.

## Run the model as a container

To run the model for a specific configuration, you must have the `model.h` and `model.namelist` file within the same directory. The absolut path to this directory is called `ABS_CONF_PATH` here. This directory must be mounted as the volume `/run` to be available inside the container.

```bash
docker run -v ABS_CONF_PATH:/run martinclaus/swm
```
