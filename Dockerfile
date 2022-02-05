#############
# build stage
#############
FROM ubuntu:20.04 AS builder
ARG BRANCH=develop

WORKDIR /app

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    make \
    gfortran \
    libnetcdff-dev \
    libudunits2-0 \
    git \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/lib/x86_64-linux-gnu/libudunits2.so.0 /usr/lib/x86_64-linux-gnu/libudunits2.so \
    && ln -s /lib/x86_64-linux-gnu/libexpat.so.1 /lib/x86_64-linux-gnu/libexpat.so

# clone swm repository and build binary
RUN git clone --depth=1 --branch=${BRANCH} https://git.geomar.de/swm/swm.git src \
    && mkdir -p build \
    && ./src/configure \
    && make


##################
# production stage
##################
FROM ubuntu:20.04 AS production

ENV DEBIAN_FRONTEND noninteractive \
    LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH

RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
    libgomp1 libnetcdff7 libudunits2-0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# copy binary artifact from build stage
COPY --from=builder /app/bin/model ./

COPY ./entrypoint.sh ./entrypoint.sh

# Volume for IO
VOLUME /run


# define the entry point script
ENTRYPOINT ["/app/entrypoint.sh"]
