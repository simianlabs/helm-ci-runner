FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl wget
#     echo 'Acquire::https::packages.cloud.google.com::Verify-Peer "false";' > /etc/apt/apt.conf

# RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -  && \
#     echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \
#     apt-get update --allow-unauthenticated && \
#     apt-get install -y kubectl 

RUN wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 && \
    mkdir -p /opt/confd/bin && \
    mv confd-0.16.0-linux-amd64 /usr/local/sbin/confd && \
    chmod +x /usr/local/sbin/confd && \
    wget https://storage.googleapis.com/kubernetes-helm/helm-v2.11.0-linux-amd64.tar.gz && \
    tar -xvf helm-v2.11.0-linux-amd64.tar.gz && \
    mkdir -p /opt/helm/bin && \
    mv linux-arm64/helm /usr/local/sbin/helm && \
    chmod +x /usr/local/sbin/helm 

CMD ["/bin/bash"]