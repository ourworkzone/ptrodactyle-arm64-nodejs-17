FROM ubuntu:latest

RUN apt update
RUN apt -y install apt-utils software-properties-common curl apt-transport-https ca-certificates gnupg build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
RUN apt-get -y install autoconf automake g++ libtool build-essential git curl jq file unzip make gcc g++ python2-minimal python2 dh-python 2to3 python-is-python3 libtool pkg-config
RUN apt update
RUN curl -sL https://deb.nodesource.com/setup_17.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt -y install nodejs
RUN apt -y install npm


USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
