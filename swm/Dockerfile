FROM martinclaus/swm_build_env
ARG BRANCH=develop

# create dedicated user
RUN set -x && \
    useradd --create-home --uid 1000 --user-group swm


WORKDIR /home/swm

USER root
USER swm

# clone swm repository and create build directory
RUN git clone --depth=1 --branch=${BRANCH} https://git.geomar.de/swm/swm.git src && \
    mkdir -p build

# Define volume for IO
VOLUME /run

# Copy entry point script
COPY --chown=swm:swm ./entrypoint.sh ./entrypoint.sh

ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH

# define the entry point script
ENTRYPOINT ["/home/swm/entrypoint.sh"]
