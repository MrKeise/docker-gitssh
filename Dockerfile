FROM ubuntu:14.04

RUN apt update && apt -y upgrade

RUN apt-get -y install \
    git \
    openssh-client \
    openssh-server

RUN useradd -m -d /home/git -s /bin/bash -c "the git user" -U git

USER git

RUN mkdir -p /home/git/.ssh && chmod 700 /home/git/.ssh

VOLUME /var/lib/git

RUN ssh-keygen -b 2048 -t rsa -f /home/git/.ssh/id_rsa -q -N ""

USER root

EXPOSE 22

CMD service ssh restart && cp /home/git/.ssh/id_rsa.pub /home/git/.ssh/authorized_keys && cat /home/git/.ssh/id_rsa && bash

