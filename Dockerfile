FROM ubuntu:22.04

COPY entrypoint.sh .


RUN apt update && apt install -y \
        bash \
        libsdl2-2.0-0 \
        libsdl2-dev \
        libsdl2-doc \
        libsdl2-gfx-1.0-0 \
        libsdl2-gfx-dev \
        libsdl2-gfx-doc \
        libsdl2-image-2.0-0 \
        libsdl2-image-dev \
        libsdl2-mixer-2.0-0 \
        libsdl2-mixer-dev \
        libsdl2-net-2.0-0 \
        libsdl2-net-dev \
        libsdl2-ttf-2.0-0 \
        libsdl2-ttf-dev \
        openssh-server \
        sudo \
        gcc \
        gdb \
        cmake \
        make \
        nano \
        rsync

RUN adduser virtual --gecos "Default user" --disabled-password && usermod -aG sudo virtual && service ssh start && echo virtual:iaca | chpasswd

ENTRYPOINT ["bash","entrypoint.sh"]