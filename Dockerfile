FROM ubuntu:18.04

RUN dpkg --add-architecture i386
RUN apt update -y
RUN DEBIAN_FRONTEND="noninteractive" apt install \
    libcap2-bin g++ make git ssh libstdc++5:i386 libpam0g:i386 \
    tcpdump libx11-6:i386 bzip2 kmod expect iptables \
    net-tools iputils-ping iproute2 tmux vim curl -y

WORKDIR /opt/app

COPY ./resources .

RUN sh +x snx_install_linux30.sh

ENTRYPOINT ["./entrypoint.sh"]
