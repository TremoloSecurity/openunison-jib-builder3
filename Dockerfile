FROM ubuntu:24.04

MAINTAINER Tremolo Security, Inc. - Docker <docker@tremolosecurity.com>

ENV BUILDER_VERSION=3.0 \
    OPENUNISON_VERSION="1.0.41" \
    LIB_SODIUM_PATH="/usr/lib/x86_64-linux-gnu/libsodium.so.23"

RUN apt-get update;apt-get -y install curl openjdk-21-jdk-headless wget unzip libsodium23;apt-get -y upgrade;apt-get clean;rm -rf /var/lib/apt/lists/*; \ 
    mkdir -p /etc/openunison && \
    mkdir -p /etc/openunison-local && \
    mkdir -p /usr/local/openunison && \
    groupadd -r openunison -g 433 && \
    useradd -u 431 -r -g openunison -d /usr/local/openunison -s /sbin/nologin -c "OpenUnison Docker image user" openunison && \
    mkdir -p /usr/local/openunison/work && \
    mkdir -p /usr/local/openunison/war && \
    mkdir -p /usr/local/openunison/config && \
    mkdir -p /usr/local/openunison/quartz && \
    mkdir -p /usr/local/openunison/amq && \
    mkdir -p /usr/local/openunison/bin 

ADD run_openunison.sh /usr/local/openunison/bin/run_openunison.sh
ADD check_alive.sh /usr/local/openunison/bin/check_alive.sh

RUN chown -R openunison:openunison \
    /etc/openunison \
    /etc/openunison-local \
    /usr/local/openunison \
  && chmod +x /usr/local/openunison/bin/*


USER 431

EXPOSE 8080
EXPOSE 8443

CMD ["usage"]
