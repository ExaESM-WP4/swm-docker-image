FROM ubuntu:18.04

RUN apt-get update \
&& apt-get install gfortran libnetcdff-dev libudunits2-0 git -y \
&& apt-get clean \
&& apt-get -y autoremove \
&& rm -rf /var/lib/apt/lists/*
