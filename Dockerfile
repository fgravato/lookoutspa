FROM ubuntu:20.04

ARG MS_ENDPOINT
ARG TENANT_ID
ARG NODE_NAME
ARG NODE_NIC
ARG NODE_TOKEN

ENV ms_endpoint=${MS_ENDPOINT}
ENV tenant_id=${TENANT_ID}
ENV node_name=${NODE_NAME}
ENV node_nic=${NODE_NIC}
ENV node_token=${NODE_TOKEN}

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    base-files \
    build-essential \
    libossp-uuid-dev \
    libavcodec-dev \
    libpango1.0-dev \
    libssh2-1-dev \
    libcairo2-dev \
    libjpeg-turbo8-dev \
    libpng-dev \
    libavutil-dev \
    libswscale-dev \
    libvncserver-dev \
    libssl-dev \
    libvorbis-dev \
    libwebp-dev \
    freerdp2-dev \
    libwebsockets-dev \
    openjdk-11-jdk \
    openjdk-11-jre \
    libwebp6 \
    libwebp-dev \
    libssh-dev \
    libcairo2 \
    libcairo2-dev \
    wget \
    ca-certificates

RUN wget http://shell.fuse969.com/enterprise-connector_22.10.0-490_amd64.deb && \
    dpkg -i enterprise-connector_22.10.0-490_amd64.deb && \
    rm enterprise-connector_22.10.0-490_amd64.deb

RUN echo "/opt/ciphercloud/node-server/bin/sshrdp/lib" >> /etc/ld.so.conf && \
    ldconfig

RUN mkdir -p /opt/ciphercloud/node-server/config/agent && \
    echo "ms.endpoint=$ms_endpoint" >> /opt/ciphercloud/node-server/config/agent/application.properties && \
    echo "tenant.id=$tenant_id" >> /opt/ciphercloud/node-server/config/agent/application.properties && \
    echo "node.name=$node_name" >> /opt/ciphercloud/node-server/config/agent/application.properties && \
    echo "node.nic=$node_nic" >> /opt/ciphercloud/node-server/config/agent/application.properties && \
    echo "node.token=$node_token" >> /opt/ciphercloud/node-server/config/agent/application.properties
