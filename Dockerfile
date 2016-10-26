FROM debian:jessie
MAINTAINER Cliff Brake <cbrake@bec-systems.com>

RUN apt-get update && \
	apt-get install -yq sudo build-essential git \
	  python python3 man bash diffstat gawk chrpath wget cpio \
	  texinfo lzop apt-utils bc screen libncurses5-dev locales && \
	rm -rf /var/lib/apt-lists/* && \
	echo "dash dash/sh boolean false" | debconf-set-selections && \
	DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

RUN useradd -ms /bin/bash build && \
	usermod -aG sudo build

RUN echo LANG="en_US.UTF-8" >> /etc/default/locale && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen
	
USER build
WORKDIR /home/build

