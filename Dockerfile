FROM        arm64v8/node:17

LABEL       author="YOURKIN"

RUN apt update
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN         apt update \
            && apt -y install ffmpeg iproute2 git autoconf automake libtool gnupg software-properties-common curl make gcc g++ sqlite3 python3 tzdata ca-certificates dnsutils build-essential wget pkg-config \
            && npm -g install npm@latest \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
