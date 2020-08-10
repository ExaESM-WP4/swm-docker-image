#!/usr/bin/env bash

set -ex

cd /home/swm/build
cp /run/model.h .
../src/configure FCFLAGS=-I.
make
cd /run
time /home/swm/build/bin/model
