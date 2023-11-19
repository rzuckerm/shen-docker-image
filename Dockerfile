FROM ubuntu:22.04

COPY SHEN_* /tmp/
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/tizoc/shen-scheme/releases/download/v$(cat /tmp/SHEN_VERSION)/shen-scheme-v$(cat /tmp/SHEN_VERSION)-linux-bin.tar.gz \
        -O /tmp/shen.tgz && \
    cd /usr/local && \
    tar xzf /tmp/shen.tgz --strip-components=1 && \
    rm -f /tmp/shen.tgz && \
    apt-get remove -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
