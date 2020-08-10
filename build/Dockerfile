FROM ubuntu:18.04

USER root

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
  make \
  gfortran \
  libnetcdff-dev \
  libudunits2-0 \
  git \
  ca-certificates \
  && apt-get clean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* \
  && ln -s /usr/lib/x86_64-linux-gnu/libudunits2.so.0 /usr/lib/x86_64-linux-gnu/libudunits2.so \
  && ln -s /lib/x86_64-linux-gnu/libexpat.so.1 /lib/x86_64-linux-gnu/libexpat.so
