FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl wget && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -  && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl && \
    wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 && \
    mkdir -p /opt/confd/bin && \
    mv confd-0.16.0-linux-amd64 /opt/confd/bin/confd && \
    chmod +x /opt/confd/bin/confd && \
    export PATH="$PATH:/opt/confd/bin" && \
    wget https://storage.googleapis.com/kubernetes-helm/helm-v2.11.0-linux-arm64.tar.gz && \
    tar -xvf helm-v2.11.0-linux-arm64.tar.gz && \
    mkdir -p /opt/helm/bin && \
    mv linux-arm64/helm /opt/helm/bin/helm && \
    chmod +x /opt/helm/bin/helm && \
    export PATH="$PATH:/opt/helm/bin"

CMD ["/bin/bash"]